-- APLICADO em 08/11. Quando um jogador muda de nome, o nome novo passa também
-- para presenças, dívidas e pagamentos (antes ficava o antigo no histórico).
create or replace function public.propagar_nome_jogador()
returns trigger language plpgsql security definer set search_path to 'public' as $$
begin
  if new.name is distinct from old.name then
    update debts set player_name = new.name where player_id = new.id;
    update game_attendance set player_name = new.name where player_id = new.id;
    update payments set debtor_name = new.name where debtor_id = new.id;
    update payments set payer_name = new.name where payer_id = new.id;
  end if;
  return null;
end; $$;
create trigger trg_propagar_nome_jogador after update of name on public.players
  for each row execute function public.propagar_nome_jogador();
