# Por fazer

Lista de trabalho pendente na app Hoje Há Jogo. As ideias vindas de apps
concorrentes estão em `IDEIAS-CONCORRENCIA.md`; aqui estão as coisas nossas.

---

## 1. Corrigir o gráfico do mealheiro (Stats → Grupo) — ✅ FEITO (26/09/2026)

**Reportado pelo Luís a 25/09/2026, com captura de ecrã.**

Causa confirmada nos dados reais (grupo 37): o gráfico só somava os jogos com
jogadores, ignorando pagamentos avulsos (`players_count=0`) que o cartão do
mealheiro já incluía — por isso o gráfico fechava em 5€ e o cartão em 23€.
Corrigido em duas fases:

1. Passou a agrupar por data e incluir todo o histórico (jogos + avulsos), não
   só os jogos.
2. Ajustado outra vez: usa `closed_at` (data real do pagamento) em vez de
   `date` (data do jogo a que o pagamento avulso diz respeito) — um
   pré-pagamento fechado hoje para o jogo da próxima semana não pode aparecer
   no futuro no gráfico.

Publicado em produção (`main`, commits `2b513da` e `b08554e`).

---

## 2. Achados da crítica de design ao ecrã do Mealheiro (26/09/2026)

Crítica `/impeccable critique` ao `GraficoMealheiro` + `PiggyBankCard`
(Stats → Grupo → Mealheiro). Nota: **16/32** nas heurísticas de Nielsen.
Relatório completo em
`.impeccable/critique/2026-09-26T22-33-27Z__app-jsx-graficomealheiro-piggybankcard.md`.

**Luís decidiu (26/09/2026): fazer tudo, por esta ordem, quando houver
créditos** (ficou por fazer por falta de créditos semanais nesta sessão):

1. **[P0] Cor do cartão contradiz o próprio DESIGN.md** — o cartão usa
   gradiente turquesa (`#0891b2`→`#0e7490`), mas o DESIGN.md já diz "saldo do
   mealheiro = verde confirmado (`#4ade80`)". Trocar gradiente e `stroke` do
   gráfico para verde; fundo do cartão para `#14160f` + borda, como já faz a
   variante `showHero=false` no mesmo ficheiro.
2. **[P1] `PiggyBankCard` muda de paleta consoante quem o chama** — duas
   linguagens visuais na mesma secção (o cartão hero turquesa vs.
   `TreasurerBalances`/despesas, que já usam bem os tokens do sistema).
   Unificar; se hero/compacto precisar de diferença, que seja de tamanho, não
   de cor.
3. **[P1] Duas fontes de verdade para o mesmo saldo** — o gráfico recalcula a
   partir de `history`; o "SALDO ATUAL" vem de `piggybank` calculado noutro
   lado. Sem garantia visível de que convergem sempre. Derivar o último ponto
   do gráfico diretamente de `piggybank`, ou garantir por teste que batem
   sempre certo.
4. **[P2] Simplificar o gráfico para poucos pontos** — um gráfico de linha
   completo (eixos + tooltip) para 2-4 pontos é complexidade a mais. Trocar
   por lista compacta "jogo → saldo" ou sparkline sem eixos enquanto há poucos
   jogos.
5. **[P3] Cinzentos Tailwind soltos** (`#6b7280`, `#fca5a5`, `#86efac`...) em
   vez dos tokens do sistema (`#8a9080` texto-suave, `#565c4d`
   texto-apagado).

---

## 3. Ecrã de novidades dentro da app

Ninguém soube do botão "não vou", do voto secreto no MVP, do lembrete da manhã
do jogo nem do grupo de demonstração. Ver `IDEIAS-CONCORRENCIA.md`.

## 4. Apagar mensagens do chat (admin)

Hoje não há nada a fazer se entrar spam num grupo. Ver
`IDEIAS-CONCORRENCIA.md`.

## 5. Cor e nome por equipa

Resolve a confusão de quem é dos coletes. Ver `IDEIAS-CONCORRENCIA.md`.

## 6. Estado "lesionado" no perfil

Evita mandar lembretes semanais a quem está a recuperar. Ver
`IDEIAS-CONCORRENCIA.md`.

---

## Decisões em aberto (do Luís)

- **Ser grátis e não exigir instalação** são para ficar como constrangimentos
  duráveis, ou podem mudar? Hoje estão registados no `PRODUCT.md` apenas como
  o que está em produção.
- O `PRODUCT.md` e o `DESIGN.md` devem mudar-se para junto do código da app
  (`hoje-ha-jogo`), em vez de ficarem no repositório do site?
- **Relevo/sombras:** o Luís disse que quer, o `DESIGN.md` tem um vocabulário
  proposto, mas nada foi implementado. A app continua plana.

## A medir, sem fazer nada

- **Grupo de demonstração** (no ar desde 25/09): quantos o vêem, quantos
  respondem, quantas contas saem daí. Se muita gente vir e ninguém criar conta,
  a ideia falhou e diz-se isso.
- **UTMs** preparadas mas nunca usadas: na próxima ronda de posts, saber que
  grupos de Facebook valem a pena.
