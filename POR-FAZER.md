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

1. **[P0] Cor do cartão contradiz o próprio DESIGN.md — ✅ FEITO (26/09/2026)**
   — cartão passou de gradiente turquesa a `#14160f`+borda com números a
   verde, igual à variante `showHero=false`; `stroke` do gráfico também
   passou a verde. Publicado em produção (`main`, commit `01f4f0c`).
2. **[P1] `PiggyBankCard` muda de paleta consoante quem o chama** — duas
   linguagens visuais na mesma secção (o cartão hero turquesa vs.
   `TreasurerBalances`/despesas, que já usam bem os tokens do sistema).
   Unificar; se hero/compacto precisar de diferença, que seja de tamanho, não
   de cor.
3. **[P1] Duas fontes de verdade para o mesmo saldo — ✅ RESOLVIDO DE GRAÇA
   (26/09/2026)** — quando o gráfico passou a agrupar por `closed_at`
   somando todo o `history` (correção do item 1), ficou a somar exactamente
   o mesmo total que `piggybank`. Matematicamente já não podem divergir;
   não foi preciso nenhum código extra.
4. **[P2] Simplificar o gráfico para poucos pontos** — um gráfico de linha
   completo (eixos + tooltip) para 2-4 pontos é complexidade a mais. Trocar
   por lista compacta "jogo → saldo" ou sparkline sem eixos enquanto há poucos
   jogos.
5. **[P3] Cinzentos Tailwind soltos — ✅ FEITO (26/09/2026)** — substituídos
   pelos tokens do sistema em todo o ficheiro (ver item 3, achado nº4, que
   cobre a substituição global).

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

1. **[P0] Ecrã do jogador viola a "Regra do Ouro Raro" do próprio DESIGN.md
   — ✅ FEITO (26/09/2026)** — a contagem decrescente do `FieldHeader` fica
   como o único dourado do ecrã; o cartão de notificações e o cartão de
   votação MVP passaram a neutro (`#23271b`/branco). Publicado (commit
   `5bffc6d`).
2. **[P0] Admin: duas linguagens de separador incompatíveis — ✅ FEITO
   (26/09/2026)** — a barra de sub-abas do admin deixou de usar o verde de
   "confirmar presença"; passou a um destaque neutro (`#23271b` + texto
   branco), sem semântica de cor. Publicado em produção (commit `01f4f0c`).
3. **[P0] Admin: até 3 dourados simultâneos — ✅ FEITO (26/09/2026)** — o
   banner do código de convite (só aparece com o grupo vazio) e o cartão de
   notificações partilhado passaram a neutro; só a contagem decrescente
   continua dourada. Publicado (commit `5bffc6d`).
4. **[P1] Jogador: cinzentos fora da paleta — ✅ FEITO (26/09/2026)** —
   172 ocorrências de `#6b7280`/`#9ca3af`/`#64748b`/`#4b5563` em todo o
   ficheiro (não só no jogador — também Equipas e Chat, ver item 3b nº9)
   substituídas por `#8a9080`/`#565c4d`. Publicado (commit `a2a694c`).
5. **[P1] Jogador: carga vertical excessiva antes da lista de presença**
   (6+ blocos condicionais) — recolher chat/zona/posição/equipas em
   `ExpandableCard`s.
6. **[P1] Admin: confirmar a própria presença duplica a `PlayerView`** e
   empurra as ferramentas de gestão (dívidas, sem resposta, fechar jogo) para
   depois do scroll.
7. **[P1] Admin: Dívidas/Histórico (botões soltos) vs. Equipas/Jogadores/Gerir
   (abas)** — dois sistemas de navegação para o mesmo conceito.
8. **[P2] Landing: splash usa Bebas Neue — ✅ FEITO (26/09/2026)** — trocado
   de Arial Black; a fonte passou também a ser carregada no `<head>` (Google
   Fonts) para estar disponível a tempo do splash. Publicado (commit `01f4f0c`).
9. **[P2] Landing: contraste do rodapé — ✅ FEITO (26/09/2026)** — subido de
   `#565c4d` para `#8a9080` (texto-suave). Publicado (commit `01f4f0c`).
10. **[P2] Jogador: `MBWayButton` introduz ciano não documentado**, 5ª cor de
    destaque simultânea no ecrã de confirmação.
11. **[P2] Admin: `GroupStatusCard` só mostra a mensagem mais otimista —
    ✅ FEITO (26/09/2026)** — o aviso de "faltam guarda-redes" passou a ser
    empurrado primeiro para a lista, por isso ganha a "quase completo"
    quando os dois são verdade ao mesmo tempo. Publicado (commit `0718334`).
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

1. **[P0] Equipas: a cor da "Equipa B" é o azul reservado ao guarda-redes —
   ✅ FEITO (26/09/2026)** — trocado para roxo (`#7c3aed`/`#c4b5fd`), já
   presente na paleta de avatares. Publicado (commit `01f4f0c`).
2. **[P0] Chat: o indicador de mensagem não lida está estruturalmente morto**
   — as chamadas reais passam sempre `unreadChat={false}`, e o Chat nem é um
   separador do `BottomNav` (é um botão dentro do ecrã de Jogo). Ninguém é
   avisado de mensagem nova a não ser que abra o chat "por acaso" — mina
   diretamente o propósito do chat como substituto do WhatsApp. **Único
   achado funcional desta ronda, não só visual.**
3. **[P0] Zona: o azul do GR reutilizado duas vezes — ✅ FEITO (26/09/2026)**
   — caixa de dica e seletor de "dias habituais" passaram a verde, igual ao
   seletor de concelho ao lado (resolve também o achado nº7, a inconsistência
   verde/azul). Publicado (commit `01f4f0c`).
4. **[P1] Equipas: terceira equipa usa âmbar — ✅ FEITO (26/09/2026)** —
   trocado para laranja (`#ea580c`/`#fdba74`). Publicado (commit `01f4f0c`).
5. **[P1] Equipas: bordas de 2px — ✅ FEITO (26/09/2026)** — trocadas por
   1px (botão de sorteio, animação, cartões de equipa). Publicado
   (commit `0718334`).
6. **[P1] Chat: falha silenciosa ao enviar mensagem — ✅ FEITO
   (26/09/2026)** — `sendMessage` agora verifica `error`, reverte a
   mensagem otimista e avisa o utilizador, mesmo padrão do voto MVP.
   Publicado (commit `0718334`).
7. **[P1] Zona: inconsistência interna de cor — ✅ FEITO junto com o nº3
   (26/09/2026)** — dia selecionado passou a verde, igual ao concelho.
8. **[P1] Zona: sem validação do contacto WhatsApp** — número mal escrito só
   se descobre quando alguém tenta contactar e falha.
9. **[P2]** Equipas: ~~cinzentos fora da paleta~~ ✅ feito junto com o item 3
   nº4. Chat: sem editar/apagar mensagem própria; ~~cinzentos fora da
   paleta no nome/hora~~ ✅ feito. Zona: pode ficar "disponível" sem zona
   definida; lista de 34 concelhos sem pesquisa nem ordem alfabética.
10. **[P3]** Equipas: alvos de toque pequenos no seletor de mover jogador.
    Chat: botão de enviar sem estado desabilitado; mensagens longas sem
    quebra de palavra. Zona: escritas na BD sem tratamento de erro.

## 3c. Landing real (LandingView, não o index.html) — ✅ FEITO (26/09/2026)

Pedido pelo Luís: analisar a página que os visitantes reais veem (não o
`index.html`, que é só o fallback SEO/no-JS já revisto no item 3 — o
`LandingView` em `App.jsx` é bem mais trabalhado e é o que carrega de facto).

**Hipótese principal para a conversão a zero em 28 dias (164 visitas, 136
frias, 3 toques, 0 contas):** o CTA principal ficava muito provavelmente
abaixo da dobra no telemóvel — cabeçalho + título + subtítulo (~280px) +
mockup do telemóvel (~440px) = ~720px antes de qualquer botão, mais do que a
altura visível da maioria dos ecrãs médios.

Feito:
1. Os 2 botões principais ("Criar grupo grátis" / "Ver um grupo a
   funcionar") subiram para antes do mockup, garantindo que aparecem cedo
   independentemente do tamanho do ecrã.
2. Acrescentada a linha "Sem instalar. Abre no browser." — uma das 4
   promessas centrais do PRODUCT.md que tinha desaparecido da página real.
3. Corrigida a cor do link "Já tenho conta" (`#22c55e`, fora da paleta).
4. Labels da grelha de funcionalidades trocados de nomes ("Presenças",
   "Stats") para benefícios ("A lista faz-se sozinha", "Sabes quem falta
   mais").
5. Prova social honesta acrescentada: número real do grupo 37 (27
   jogadores), sem inventar testemunhos — alinhado com a regra do
   PRODUCT.md de "números reais ou nada".

Publicado em produção (`main`, commit `567e3b4`).

**Bloco 4 — ✅ FEITO (26/09/2026):** o "8/12" e a barra de progresso do
mockup agora contam/enchem de 0 a 8 em 900ms ao carregar a página (a barra
calcula a largura a partir do mesmo contador, sem lógica separada). Único
movimento da página, mostra literalmente a promessa do título. Publicado
em produção (`main`, commit `660d586`).

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
