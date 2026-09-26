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

## 3. Achados da crítica de design — Landing, Jogador, Admin (26/09/2026)

Crítica `/impeccable critique` aos 3 ecrãs mais visíveis: landing (`index.html`),
ecrã do jogador (`PlayerView`, confirmação de presença) e admin (`AdminView`,
aba "Jogo"). Notas: landing 15/20 (Bom), jogador 26/36 (Bom), admin 27/40
(Aceitável). Relatório completo em
`.impeccable/critique/2026-09-26T22-47-40Z__landing-playerview-adminview-jogo.md`.

**Padrão comum aos três ecrãs** (mais importante que qualquer achado isolado): o
sistema documentado no DESIGN.md é mais disciplinado do que o sistema
implementado. Falta um "orçamento de cor por ecrã" — nada impede que 2-3
dourados apareçam juntos, ou que o verde reservado a "confirmar presença" seja
reaproveitado na navegação.

**Luís decidiu (26/09/2026): só registar na lista por agora, sem implementar.**
Por ordem de severidade:

1. **[P0] Ecrã do jogador viola a "Regra do Ouro Raro" do próprio DESIGN.md**
   — countdown dourado + cartão de notificações dourado + cartão MVP dourado
   podem coexistir no mesmo scroll. Mover o pedido de notificações para o
   onboarding, ou recolorir.
2. **[P0] Admin: duas linguagens de separador incompatíveis** — o `BottomNav`
   usa dourado para o separador ativo (correto), mas a barra de sub-abas do
   admin (Jogo/Equipas/Jogadores/Gerir) usa o **mesmo verde reservado à ação
   "confirmar presença"** para marcar a aba ativa. Unificar com o `BottomNav`
   ou usar um verde claramente distinto.
3. **[P0] Admin: até 3 dourados simultâneos**, agravado pelo código de convite
   gigante (48px) — pior justamente no primeiro grupo de um admin novo, o
   cenário de aquisição mais comum.
4. **[P1] Jogador: cinzentos fora da paleta usados quase o dobro dos tokens
   oficiais** (`#6b7280`×92, `#4b5563`×57 vs. `#8a9080`×62, `#565c4d`×27) —
   substituir globalmente.
5. **[P1] Jogador: carga vertical excessiva antes da lista de presença**
   (6+ blocos condicionais) — recolher chat/zona/posição/equipas em
   `ExpandableCard`s.
6. **[P1] Admin: confirmar a própria presença duplica a `PlayerView`** e
   empurra as ferramentas de gestão (dívidas, sem resposta, fechar jogo) para
   depois do scroll.
7. **[P1] Admin: Dívidas/Histórico (botões soltos) vs. Equipas/Jogadores/Gerir
   (abas)** — dois sistemas de navegação para o mesmo conceito.
8. **[P2] Landing: splash usa Arial Black em vez de Bebas Neue** — quebra a
   marca na primeira impressão.
9. **[P2] Landing: contraste insuficiente no rodapé** (`#565c4d` sobre
   `#0a0a0a`, 2.9:1, mínimo AA é 4.5:1) — apanhado pelo detector automático.
10. **[P2] Jogador: `MBWayButton` introduz ciano não documentado**, 5ª cor de
    destaque simultânea no ecrã de confirmação.
11. **[P2] Admin: `GroupStatusCard` só mostra a mensagem mais otimista** —
    pode esconder "falta guarda-redes" atrás de "quase completo".
12. **[P3]** Landing: fallback SEO não usa tokens tipográficos; listas com
    bullets nativos do browser. Jogador: botão fica 600ms em "A processar..."
    sem feedback otimista na lista.

## 3b. Achados da crítica de design — Equipas, Chat, Zona (26/09/2026)

Crítica `/impeccable critique` ao Lote 1 dos ecrãs restantes: revelação de
Equipas (`TeamsReveal`/`AutoTeamsDisplay`), `ChatView`, `ZonaView`. Notas:
Equipas 26/40, Chat 22/40, Zona 23/40 (todos "Aceitável"). Relatório completo
em `.impeccable/critique/2026-09-26T22-57-23Z__equipas-chatview-zonaview.md`.

**Achado novo, mais grave que os das rondas anteriores:** o azul reservado ao
guarda-redes está a ser usado como cor genérica de "info"/"seleção" em dois
ecrãs diferentes (Equipas e Zona) — não é introduzir uma cor nova, é esvaziar
o significado de uma cor que já tinha uma regra exclusiva no DESIGN.md.

**Luís decidiu (26/09/2026): só registar na lista por agora, sem implementar.**
Por ordem de severidade:

1. **[P0] Equipas: a cor da "Equipa B" é o azul reservado ao guarda-redes**
   (`TEAM_COLORS[1]`, `#2563eb`/`#60a5fa`) — um GR na Equipa B fica com o
   badge de GR (também azul) dentro de um cartão já todo azul, a posição
   desaparece dentro da cor da equipa. Escolher uma terceira cor não-azul.
2. **[P0] Chat: o indicador de mensagem não lida está estruturalmente morto**
   — as chamadas reais passam sempre `unreadChat={false}`, e o Chat nem é um
   separador do `BottomNav` (é um botão dentro do ecrã de Jogo). Ninguém é
   avisado de mensagem nova a não ser que abra o chat "por acaso" — mina
   diretamente o propósito do chat como substituto do WhatsApp. **Único
   achado funcional desta ronda, não só visual.**
3. **[P0] Zona: o azul do GR reutilizado duas vezes** — na caixa de dica do
   topo e no seletor de "dias habituais", ambos sem qualquer ligação à
   posição de guarda-redes.
4. **[P1] Equipas: terceira equipa usa âmbar**, a mesma cor de "sem
   resposta" no resto da app.
5. **[P1] Equipas: bordas de 2px espalhadas pelo componente**, contra a
   regra explícita de 1px.
6. **[P1] Chat: falha silenciosa ao enviar mensagem** — `sendMessage` não
   verifica `error` nem reverte o estado local (ao contrário do voto MVP,
   que já faz isto bem); sem rede, a mensagem parece enviada mas nunca
   chega ao grupo.
7. **[P1] Zona: inconsistência interna de cor** — concelho selecionado =
   verde, dia selecionado = azul, duas metáforas para a mesma interação.
8. **[P1] Zona: sem validação do contacto WhatsApp** — número mal escrito só
   se descobre quando alguém tenta contactar e falha.
9. **[P2]** Equipas: cinzentos fora da paleta em 6 sítios do componente.
   Chat: sem editar/apagar mensagem própria; cinzentos fora da paleta no
   nome/hora. Zona: pode ficar "disponível" sem zona definida; lista de 34
   concelhos sem pesquisa nem ordem alfabética.
10. **[P3]** Equipas: alvos de toque pequenos no seletor de mover jogador.
    Chat: botão de enviar sem estado desabilitado; mensagens longas sem
    quebra de palavra. Zona: escritas na BD sem tratamento de erro.

## 4. Ecrã de novidades dentro da app

Ninguém soube do botão "não vou", do voto secreto no MVP, do lembrete da manhã
do jogo nem do grupo de demonstração. Ver `IDEIAS-CONCORRENCIA.md`.

## 5. Apagar mensagens do chat (admin)

Hoje não há nada a fazer se entrar spam num grupo. Ver
`IDEIAS-CONCORRENCIA.md`.

## 6. Cor e nome por equipa

Resolve a confusão de quem é dos coletes. Ver `IDEIAS-CONCORRENCIA.md`.

## 7. Estado "lesionado" no perfil

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
