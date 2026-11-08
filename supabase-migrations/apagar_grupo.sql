-- Apaga um grupo e tudo o que lhe pertence, de uma vez, depois de confirmar
-- que quem pede é admin do grupo. Do lado da app as regras não deixam desligar
-- os outros jogadores (players.group_id) e o grupo ficava a meio (08/11).
create or replace function public.apagar_grupo(p_group_id bigint)
returns void language plpgsql security definer set search_path to 'public' as $$
declare convidados bigint[];
begin
  if not public.is_admin_of_group(p_group_id) then
    raise exception 'Só o admin do grupo o pode apagar';
  end if;
  perform set_config('request.jwt.claim.role','service_role',true);
  select array_agg(pg.player_id) into convidados
    from player_groups pg join players p on p.id=pg.player_id
    where pg.group_id=p_group_id and coalesce(p.is_guest,false);
  delete from mvp_votes where group_id=p_group_id;
  delete from chat_messages where group_id=p_group_id;
  delete from game_attendance where group_id=p_group_id;
  delete from game_history where group_id=p_group_id;
  delete from debts where group_id=p_group_id;
  delete from payments where group_id=p_group_id;
  delete from season_stats where group_id=p_group_id;
  delete from treasurer_balances where group_id=p_group_id;
  delete from bug_reports where group_id=p_group_id;
  delete from game_info where group_id=p_group_id;
  delete from player_groups where group_id=p_group_id;
  if convidados is not null then delete from players where id = any(convidados); end if;
  update players set group_id=null where group_id=p_group_id;
  delete from groups where id=p_group_id;
end $$;
revoke execute on function public.apagar_grupo(bigint) from public, anon;
grant execute on function public.apagar_grupo(bigint) to authenticated;

-- Limpeza do grupo de teste 85 que ficou a meio no teste
select set_config('request.jwt.claim.role','service_role',true);
update players set group_id=null where group_id=85;
delete from groups where id=85;
