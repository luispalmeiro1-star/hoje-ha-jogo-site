-- Promove sozinho quem está em espera quando sobra um lugar (sai alguém, é
-- removido, ou o admin sobe o limite). Usa a função promote_waitlist que já existe.
create or replace function public.trg_promover_fila_update()
returns trigger language plpgsql security definer set search_path to 'public' as $$
declare gid bigint; papel text;
begin
  if pg_trigger_depth() > 1 then return null; end if;
  papel := current_setting('request.jwt.claim.role', true);
  for gid in
    select distinct o.group_id from old_rows o join new_rows n on n.id = o.id
    where o.status = 'in' and o.membership_status = 'active'
      and (n.status <> 'in' or n.membership_status <> 'active')
  loop perform public.promote_waitlist(gid); end loop;
  perform set_config('request.jwt.claim.role', coalesce(papel, ''), true);
  return null;
end; $$;

create or replace function public.trg_promover_fila_delete()
returns trigger language plpgsql security definer set search_path to 'public' as $$
declare gid bigint; papel text;
begin
  if pg_trigger_depth() > 1 then return null; end if;
  papel := current_setting('request.jwt.claim.role', true);
  for gid in
    select distinct o.group_id from old_rows o
    where o.status = 'in' and o.membership_status = 'active'
      and exists (select 1 from groups g where g.id = o.group_id)
  loop perform public.promote_waitlist(gid); end loop;
  perform set_config('request.jwt.claim.role', coalesce(papel, ''), true);
  return null;
end; $$;

create or replace function public.trg_promover_fila_limite()
returns trigger language plpgsql security definer set search_path to 'public' as $$
declare papel text;
begin
  if pg_trigger_depth() > 1 then return null; end if;
  papel := current_setting('request.jwt.claim.role', true);
  perform public.promote_waitlist(new.id);
  perform set_config('request.jwt.claim.role', coalesce(papel, ''), true);
  return null;
end; $$;

drop trigger if exists trg_promover_fila_update on public.player_groups;
create trigger trg_promover_fila_update after update on public.player_groups
  referencing old table as old_rows new table as new_rows
  for each statement execute function public.trg_promover_fila_update();

drop trigger if exists trg_promover_fila_delete on public.player_groups;
create trigger trg_promover_fila_delete after delete on public.player_groups
  referencing old table as old_rows
  for each statement execute function public.trg_promover_fila_delete();

drop trigger if exists trg_promover_fila_limite on public.groups;
create trigger trg_promover_fila_limite after update of max_players on public.groups
  for each row when (new.max_players > old.max_players)
  execute function public.trg_promover_fila_limite();

revoke execute on function public.trg_promover_fila_update() from public, anon, authenticated;
revoke execute on function public.trg_promover_fila_delete() from public, anon, authenticated;
revoke execute on function public.trg_promover_fila_limite() from public, anon, authenticated;
