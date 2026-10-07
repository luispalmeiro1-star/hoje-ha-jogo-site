# Por fazer

Lista de trabalho pendente na app Hoje Há Jogo. As ideias vindas de apps
concorrentes estão em `IDEIAS-CONCORRENCIA.md`; aqui estão as coisas nossas.

Relatórios completos das críticas de design (`/impeccable critique`) ficam em
`.impeccable/critique/` — esta lista só resume o que ainda falta fazer.

---

## Por fazer agora

- **Migração da BD bloqueada à espera de autorização (03/10/2026).** Dois
  achados dos avisos automáticos do Supabase, pedidos pelo Luís para
  avançar: 3 índices em falta (`chat_messages.player_id`,
  `debts.player_id`, `mvp_votes.voted_for_id`) e 2 tabelas com políticas
  de segurança duplicadas na mesma ação (`chat_messages`, `mvp_votes` —
  DELETE avaliado duas vezes). SQL já escrito e testado mentalmente
  (li as políticas exatas antes de as fundir, para não mudar
  comportamento). A ferramenta `apply_migration` pede autorização e,
  três tentativas depois, continua bloqueada — precisa que o Luís a
  aprove na interface, ou que me diga para tentar de outra forma.
- **Achados do `/impeccable` ainda por decidir (02/10/2026)**, ver relatório
  completo no histórico de chat: separar "sugestões" de "reportar
  problema" (funcionalidade nova); botão de apagar/remover mais chamativo
  que "Cancelar" nos modais novos; modais sem atalhos de teclado (Esc,
  foco); "NÃO VOU" agora custa sempre 2 toques, mesmo sem ser lesão;
  cartão de partilha sem pré-visualização antes de enviar.
- **Achados ainda por decidir, depois das duas rondas de 04/10/2026**:
  separar "sugestões" de "reportar problema" (funcionalidade nova, maior
  esforço — decisão de produto, não só de UI); ações em lote no admin
  (marcar várias dívidas como recebidas de uma vez — baixo valor agora,
  o grupo do Luís só costuma ter 0-1 dívida aberta de cada vez); pills
  "✓ confirmados" no topo do ecrã "Jogo" repetem informação que o
  acordeão logo abaixo também mostra (mudança de layout com mais risco,
  deixada de fora por cautela); 2 dots do onboarding ainda animam
  `width` em vez de `transform` (baixíssimo impacto, uma única vez por
  pessoa, não vale o risco de alterar o alinhamento dos pontos).

---

## Decisões em aberto (do Luís)

- **Não exigir instalação** fica como está por agora (constrangimento não
  declarado durável) — só "grátis" foi confirmado como promessa fixa
  (27/09/2026, registado no `PRODUCT.md`).
- **`PRODUCT.md`/`DESIGN.md` ficam no repositório do site** (decisão tomada
  27/09/2026): é aqui que a skill `/impeccable critique` já os vai buscar
  automaticamente; mudá-los para o repositório da app obrigava a montar de
  novo essa ligação sem ganhar nada em troca.

## A medir, sem fazer nada

- **Grupo de demonstração** (no ar desde 25/09): quantos o vêem, quantos
  respondem, quantas contas saem daí. Se muita gente vir e ninguém criar conta,
  a ideia falhou e diz-se isso.
- **UTMs** preparadas mas nunca usadas: na próxima ronda de posts, saber que
  grupos de Facebook valem a pena.

---

## Já feito

Registo condensado — detalhe completo nos relatórios em
`.impeccable/critique/` e no histórico de commits de `hoje-ha-jogo`.

**07/10/2026:**
- **Admin pode trocar manualmente quem está dentro com quem está em
  espera — ✅ FEITO.** Publicado em `main` (commit `8a8b1d1`), a pedido
  do Luís depois de um caso real: um convidado ficou com o lugar antes
  de um membro do grupo responder, e a promoção automática da fila só
  segue ordem de chegada — não dava para escolher especificamente quem
  entra. Novo botão 🔁 em "Jogadores", só nos jogadores em espera: abre
  a lista de quem está dentro, o admin escolhe quem sai, e os dois
  trocam de estado na hora.

**04/10/2026 (4ª ronda — `/code-review`):**
- **2 bugs reais corrigidos nas mudanças desta sessão — ✅ FEITO.**
  Publicado em `main` (commit `c746038`). O Luís pediu uma revisão de
  código; corri o `/code-review` (esforço médio) contra o diff das 3
  rondas anteriores (ícone, modais, cartão, correção da dívida) em vez
  de auditar o ficheiro inteiro de 6000+ linhas.
  - **Modais roubavam o foco de volta.** O `useEffect` que dava foco
    automático ao botão seguro dependia de `onCancel`, uma função nova
    a cada render do componente principal — e a app volta a renderizar
    com frequência (subscrições em tempo real: alguém confirma, paga,
    manda mensagem). Resultado: se alguém navegasse com Tab para o
    outro botão, o foco podia voltar a saltar para o botão errado antes
    de a pessoa carregar Enter. Corrigido separando o foco inicial (só
    corre uma vez) do atalho `Esc` (pode voltar a ligar-se sem
    problema).
  - **Partilha do cartão sem rede de segurança num caso.** Se a
    partilha da imagem falhasse por um motivo que não fosse o
    utilizador cancelar (ex: o telemóvel recusar o pedido), o botão
    ficava sem fazer nada e sem avisar — a antiga rede de segurança
    (cair para texto) só cobria falhas a gerar a imagem, não a
    partilhá-la. Reposta.

**04/10/2026 (3ª ronda — visão de jogador):**
- **Dívida antiga deixava de ser só do admin — ✅ FEITO.** Publicado em
  `main` (commit `88a5a1c`). O Luís pediu para ver a app como jogador;
  criámos uma conta de teste (`contateste`, grupo 37, fica disponível
  para o futuro) e ele mandou screenshots reais. Achado: a "Lista do
  jogo", visível a qualquer jogador (não só ao admin), mostrava "⚠️ deve
  Xâ‚¬" junto do nome de quem tinha uma dívida de um jogo anterior, ao
  lado do "Deve 3€" genérico que toda a gente tem até pagar o jogo novo
  — fazia parecer que a pessoa devia a dobrar, exposto ao grupo inteiro,
  por algo que já tem o seu próprio ecrã só para o admin ("Dívidas").
  Esse aviso passa a aparecer só na vista de admin.
  Procurei mais problemas nos ecrãs de jogador (onboarding, confirmar
  presença, posição, convidar alguém, chat) e não encontrei outros com
  risco baixo e ganho claro que valessem gastar mais créditos agora.

**04/10/2026 (2ª ronda):**
- **Mais 3 melhorias de UX — ✅ FEITO.** Publicado em `main` (commit
  `9f9df07`), a pedido do Luís ("se tens mais sugestões, aplica").
  Continuação da lista de achados da crítica geral:
  - **Atalhos de teclado nos modais.** `Esc` fecha qualquer `ConfirmModal`
    ou `ChoiceModal`, e o botão seguro recebe foco automático (o
    "Cancelar" num aviso perigoso, o "Confirmar" num normal) — antes só
    dava para usar por toque.
  - **Pré-visualização do cartão antes de partilhar.** O botão "Partilhar
    cartão" no Histórico mostra agora a imagem antes de abrir a partilha
    do telemóvel ou descarregar, com "Cancelar"/"Partilhar" — protege
    contra enviar para o grupo um cartão com algo mal renderizado.
  - **Barras de progresso mais leves.** As duas barras "Confirmados"
    animavam a propriedade `width` (obriga o browser a recalcular
    layout a cada frame); passam a animar `transform`, mais barato,
    sem mudar o aspeto visual.

**04/10/2026 (1ª ronda):**
- **Crítica geral à app com `/impeccable` (17 ecrãs reais) — ✅ FEITO.**
  Publicado em `main` (commit `61baebe`), a pedido do Luís ("mude o que
  mudar, custe o que custar"). Revisão a partir de capturas de ecrã reais
  enviadas pelo Luís em vez de abrir a app ao vivo — poupou os passos de
  navegar ecrã a ecrã. Três correções implementadas:
  - **Ícone da PWA trocado.** O ícone usado no ecrã de arranque e no
    atalho do telemóvel era uma versão antiga da marca (azul-marinho,
    tipografia diferente) e tinha uma moldura branca cosida na própria
    imagem — causa provável do "ícone esticado e desfocado" que o
    Android mostra ao instalar (o comentário já existia no
    `vite.config.js`). Novo ícone gerado por código (canvas + captura),
    seguindo a identidade "marcador do pavilhão" do `DESIGN.md`
    (preto-esverdeado, dourado raro) e sem moldura própria, para o
    Android aplicar a máscara adaptativa sem distorcer.
  - **"Em dívida" deixou de parecer um botão.** Tinha a mesma forma de
    pílula do botão "Recebido" ao lado, sem ser clicável — texto simples
    tira a ambiguidade.
  - **Ecrã vazio de "Épocas" ganhou contexto.** Era só "Nenhuma época
    anterior registada" em cinzento; passa a explicar que o resumo
    aparece quando uma época terminar.

  Dois achados verificados e descartados por serem falsos positivos da
  leitura só por imagem (o código já tinha a confirmação correta):
  apagar mensagem no chat e remover jogador já pedem confirmação via
  `askConfirm`. Restantes achados (atalhos de teclado nos modais, ações
  em lote, pills repetidas no ecrã "Jogo", animações de `width`) ficaram
  por decidir — ver "Por fazer agora".

**03/10/2026:**
- **Ecrã de Novidades atualizado — ✅ FEITO.** Publicado em `main` (commit
  `2c46013`). Achado ao procurar novas melhorias por pedido do Luís: a
  lista estava parada em 27/09 e faltavam 4 coisas já em produção — cor/
  nome por equipa, estado "lesionado", botões de presença simplificados
  e o cartão visual de partilha. Mesmo problema já identificado no
  `IDEIAS-CONCORRENCIA.md` ("lançámos funcionalidades sem que um único
  utilizador soubesse").

**01/10/2026:**
- **Cartão visual para partilhar o resumo do jogo — ✅ FEITO.** Publicado
  em `main` (commits `430cad8` e `2b69f5a`), a pedido do Luís — achava a
  mensagem de texto "fraca" para partilhar. Passa a gerar uma imagem
  (1080x1350, canvas) com toda a informação que o texto antigo tinha:
  nome do grupo configurado, resultado (com a cor e o nome reais da
  equipa vencedora, já configuráveis pelo admin), MVP, mealheiro
  (verde/vermelho conforme o saldo) e o próximo jogo quando houver um
  agendado. Conteúdo sempre centrado mesmo quando falta vencedor ou MVP
  ou não há próximo jogo — testado visualmente com nomes de grupo/equipa
  compridos, localização comprida e mealheiro negativo. Usa a Web Share
  API com ficheiro quando o browser suporta; sem isso, descarrega o PNG.
  Se a imagem falhar por algum motivo, cai de volta no texto antigo.
  (Tentei tirar o mealheiro da partilha por ser informação financeira
  interna — o Luís preferiu manter tudo igual ao texto antigo.)
- **"RECOLHIDO" não atualizava quando uma dívida era paga depois do jogo
  fechar — ✅ FEITO.** Publicado em `main` (commit `8b1c95f`), a pedido
  do Luís (apanhado ao investigar o achado do "POR JOGO" acima: 12
  jogadores a 3€ deviam dar 36€, mas o jogo de 30/09 só mostrava 30€).
  Causa: pagar uma dívida criava sempre uma entrada solta no histórico,
  datada do jogo seguinte em vez do jogo de onde a dívida veio — por
  isso o cartão do jogo original nunca via esse dinheiro, mesmo depois
  de entrar. `payDebt` passa a ler a data do jogo a partir da descrição
  da dívida ("Jogo de AAAA-MM-DD") e a somar ao `collected` desse jogo
  específico. Dados do grupo do Luís corrigidos à mão (reconstituída a
  atribuição certa pelas datas e pelo facto de só restar uma dívida
  aberta hoje) — total do mealheiro não mudou, só ficou bem distribuído
  por jogo. Não corrigido para outros grupos (risco de atribuição errada
  sem a mesma certeza que havia aqui); só o código novo, que já aplica a
  todos a partir de agora.
- **"POR JOGO" errado no histórico — ✅ FEITO.** Publicado em `main`
  (commit `8453967`), reportado pelo Luís: o jogo de 23/09 mostrava "2€"
  quando sempre custou 3€ a cada um. Causa: o valor era calculado como
  `recolhido ÷ jogadores`, que só dá o custo certo se toda a gente já
  tiver pago — naquele jogo só 7 de 11 tinham pago, 21€/11≈2. Passa a
  gravar o custo real (`cost_per_player`) no fecho do jogo, tanto no
  fecho manual (`App.jsx`) como no automático (edge function
  `close-finished-games`, redeployada em separado). Migração aplicada à
  BD: nova coluna `game_history.cost_per_player`, histórico existente
  preenchido com o custo atual de cada grupo (não varia por jogo).

**30/09/2026:**
- **Botões de presença simplificados + lesão movida para dentro do "não
  vou" — ✅ FEITO.** Publicado em `main` (commit `791821c`), a pedido do
  Luís. Os 3 textos diferentes para a mesma ação ("VOU JOGAR"/"JÁ NÃO
  VOU"/"AFINAL VOU") passam a ser sempre "VOU"/"NÃO VOU" (jogador, admin
  e demonstração). O link "Foi lesão? Marca aqui", que ficava sempre
  visível, deixa de existir à parte: agora, ao clicar em "NÃO VOU",
  aparece uma escolha (`ChoiceModal`, novo, ao lado do `ConfirmModal` de
  ontem) a perguntar o motivo — "Não vou" ou "Foi lesão".
- **Confirmação de "lesionado" antes de mudar o estado — ✅ FEITO.**
  Publicado em `main` (commit `5b9bff7`), a pedido de um jogador: clicar
  em "lesionado" mudava logo para "não vou", e quem estivesse "in" e
  clicasse sem querer perdia logo o lugar (ia para fora, com risco de dar
  o lugar a quem estivesse em espera). Os 4 botões (jogador e admin, ecrã
  de confirmar e ecrã de já respondido) passam a pedir confirmação antes.
- **`window.confirm()` nativo trocado por modal próprio — ✅ FEITO.**
  Publicado em `main` (commit `8a553c0`), a pedido do Luís ("um
  bocadinho arcaico"). Criado `askConfirm()`/`ConfirmModal`, ligados uma
  vez em `App()` por um pequeno singleton de módulo — sem precisar de
  passar a função por todos os componentes que já pediam confirmação.
  As 10 confirmações existentes (lesão, apagar mensagem, trocar de
  conta, alternar presença de outro jogador, remover jogador, sair do
  grupo, apagar grupo) passam a usar o modal da app, com vermelho nas
  ações destrutivas e verde nas neutras.

**27/09/2026 (continuação, 2ª ronda):**
- **Os dois achados do `onboard` — ✅ FEITO.** Publicado em `main` (commit
  `140e9d0`). Só os itens seguros de fazer sem ambiente de teste ao vivo:
  - Grupo sem ninguém confirmado ainda passa a mostrar "⚽ Ainda ninguém
    confirmou — sê o primeiro!" em vez de nenhuma mensagem.
  - Tutorial do admin encolhido de 10 para 7 passos (dentro dos 3-7
    recomendados): tirados os 4 slides de configuração inicial
    (MBWay, dívidas, vaga aberta, configurar grupo), que já se descobrem
    sozinhos em "Gerir" quando fizerem falta; ficam só "convidar" e "o
    resto está em Gerir".
  - De caminho (achado do `optimize`, risco zero): removidas 3
    importações do Recharts (`BarChart`, `Bar`, `Cell`) nunca usadas.
  - **Decidido não fazer** (28/09/2026, confirmado pelo Luís — nenhum é
    urgente, retirados da lista de pendências): transação na `resetGame`
    (harden), tratamento de erro nos `load*` de leitura (harden), carregar
    o Recharts só quando preciso (optimize — mudança estrutural ao
    ficheiro, risco de partir a build sem poder testar ao vivo), testar em
    ecrãs de 320px (adapt), separar o Perfil em conta/suporte (distill).
    `colorize`/`quieter`/`delight`/`overdrive`: nada encontrado que valha a
    pena mudar.
- **Levantamento com os restantes comandos `/impeccable` — ✅ FEITO.**
  Publicado em `main` (commit `5e57968`). Corrido `/impeccable onboard`
  (primeira experiência) e `/impeccable bolder` (landing), mais um
  levantamento de 2 achados por cada um dos restantes comandos (ver "Por
  fazer agora" acima para os que ficaram só registados). Aplicado:
  - **bolder** (landing, Funcionalidades): 6 etiquetas em texto cinzento
    genérico a 9.5px passam a usar a Bebas Neue (a tipografia que o resto
    da app reserva ao que importa), maiores e a branco.
  - **animate**: o número de "CONFIRMADOS" no cabeçalho do jogo já sobe
    do valor antigo para o novo em vez de saltar — como o mockup animado
    da landing já fazia.
  - **clarify**: botão de gravar (Gerir) já não mostra "SEM ALTERAÇÕES"
    (lia-se como aviso) — passa a "TUDO GUARDADO".
  - **onboard**: revisto "criar grupo" e "entrar por convite" (já muito
    bem pensados, nada a mudar); identificado que um grupo novo sem
    ninguém confirmado não mostra nenhum incentivo, e que o tutorial do
    admin tem 10 passos (mais do que os 3-7 recomendados) — ambos
    corrigidos a seguir (ver entrada de hoje abaixo).
- **Últimos itens de polish das críticas — ✅ FEITO.** Publicado em `main`
  (commits `5e0eaf5`, `f625ed0`):
  - Votação MVP ordenada por votos; nota a dizer que o voto é secreto.
  - Chat: mensagens longas já quebram a linha.
  - "Revelar equipas" deixa de usar o verde-sólido reservado.
  - Gráficos de stats: eixos e legendas já não ficam abaixo de 11px.
  - **"Configurações" do admin dividida em 3 blocos** ("Nome e dias",
    "Jogo", "Formato e equipas"), cada um com o seu próprio "guardar" —
    era o maior achado ainda por resolver de todas as críticas.

**27/09/2026:**
- **Relevo/sombras — ✅ FEITO.** Publicado em `main` (commit `79d88b5`). O
  vocabulário já estava escrito no `DESIGN.md`, nunca implementado. Aplicado
  ao nível das classes CSS partilhadas (não em cada instância), seguindo a
  Regra da Sombra Justificada: "Levantado" no cabeçalho do jogo, cartões
  expansíveis (Zona/Financeiro/Stats/Gerir), cartão de saldo do mealheiro,
  banner de estado e botões primários; "Flutuante" na barra de navegação e
  na folha do tutorial inicial; "Aceso" como novo anel dourado de foco por
  teclado (não existia nenhum indicador de foco visível antes).
- **Fase 4 (ícone Android + 4 funcionalidades novas) — ✅ FEITO.** Publicado
  em `main` (commits `16732e0`, `49dd737`, `4d22711`, `552d830`, `5d38d4c`):
  - **Ícone grande e desfocado no Android — encontrada a causa e corrigida.**
    Os ícones do manifest eram opacos, com cantos a preto sólido colados à
    borda, sem margem nenhuma. Sem uma versão "maskable" declarada, é o
    próprio Chrome/Android que gera sozinho uma versão adaptativa —
    esticando e desfocando o ícone normal para caber na forma do launcher.
    Geradas `icon-192-maskable.png`/`icon-512-maskable.png` (logótipo
    encolhido a 72%, centrado) e declaradas no manifest com
    `purpose:"maskable"`.
  - **Apagar mensagens do chat (moderação do admin)**: o botão "Apagar" já
    existente (Fase 2) passa a aparecer também nas mensagens de outras
    pessoas quando é o admin a ver o chat. De caminho, corrigido um bug
    anterior: a política de DELETE só permitia a admins — ou seja, um
    jogador comum a apagar a própria mensagem falhava sempre, silenciosamente,
    desde a Fase 2. Adicionada política que falta para o próprio autor.
  - **Ecrã de novidades dentro da app**: lista fixa no código (sem tabela
    nova), com o mesmo padrão de ponto vermelho já usado no chat. Botão
    "📣 Novidades" ao lado de Chat/Zona.
  - **Cor e nome por equipa, configurável pelo admin**: em Admin > Gerir,
    nome (ex: "Amarelos") e cor de cada equipa, a partir de uma paleta
    segura de 6 cores sem conflito com as cores reservadas do sistema.
    Fixo por grupo, não por jogo. Bónus: a Equipa A tinha o verde-sólido
    como cor por omissão — a mesma cor reservada a "confirmar presença" —,
    corrigido para vermelho mesmo em grupos que não personalizem nada.
  - **Estado "lesionado"**: não é um modo permanente no perfil — é um
    motivo do "não vou" só para aquele jogo. Link "🤕 Lesionado?" por baixo
    do botão de recusa; aparece um "🤕" ao lado do nome na lista de quem
    não vai, no admin.
  - Por fazer a seguir: as duas rondas de crítica de design que faltam
    (Lote 2 e Lote 3, ver acima).
- **Críticas de design Lote 2 e Lote 3 — ✅ FEITO.** Relatórios em
  `.impeccable/critique/`, correções publicadas em `main` (commits `51f00ae`
  Lote 2, `6036f53` Lote 3):
  - **Lote 2 (MVP/Perfil/Stats)**: `updateProfile` e upload de avatar
    passam a verificar erro e reverter em vez de mostrar sempre sucesso;
    Stats deixa de usar dourado como cor de estado (era usado em 4 sítios
    diferentes) e o Perfil deixa de ter 4 elementos dourados ao mesmo
    tempo; verde-sólido e azul-guarda-redes deixam de ser cor decorativa
    nos gráficos; "Trocar de conta" passa a pedir confirmação; Perfil
    ganha 3 cabeçalhos de secção; alvos de toque maiores; lista de
    votação MVP ordenada por nome.
  - **Lote 3 (Admin: Equipas/Jogadores/Gerir)**: alternar a presença de
    outro jogador e remover jogador passam a pedir confirmação (antes
    nenhum dos dois pedia, ao contrário de todas as outras ações
    destrutivas da app); guardar definições e o número MBWay passam a
    avisar se a gravação falhar; banner de "equipa vencedora" deixa de
    usar azul-guarda-redes (cor errada, inconsistente com a mesma ação
    na aba Equipas); verde-sólido deixa de ser a cor de "selecionado" em
    4 grupos de botões; já não podem aparecer 3 cartões dourados ao
    mesmo tempo na aba Gerir; campos sem etiqueta visível corrigidos.
- **Chat: indicador de mensagem não lida — ✅ FEITO.** Guardado em
  `localStorage` (`chat_visto_<grupo>_<jogador>`), sem precisar de tabela
  nova: compara a hora da última mensagem com a última vez que o jogador
  abriu o chat. Ponto vermelho no botão "💬 Chat" (jogador e admin) quando
  há mensagem nova de outra pessoa. Era o único achado funcional de todas as
  críticas de design — sem isto, ninguém sabia que havia mensagem nova a não
  ser abrindo o chat "por acaso". Publicado (commit `2f8b2cd`).
- **Fases 1-3 (todos os "outros achados" pendentes) — ✅ FEITO.** Publicado
  em `main` (commits `a665b3a`, `49116a3`, `ad840a7`, `b3f7079`):
  - **Zona**: `toggleDay`/`handleZone`/`handleToggleAvailable`/`saveNotes`
    passam a reverter o estado e avisar com toast se a escrita na BD falhar;
    validação do contacto WhatsApp (mínimo 9 dígitos); já não dá para ficar
    "disponível" sem escolher zona primeiro; lista de concelhos passa a ter
    pesquisa e ordem alfabética.
  - **Equipas**: botão de mover jogador de equipa com alvo de toque maior.
  - **MBWay**: cor ciano não documentada trocada por roxo (já usado em
    Equipa B/avatares), sem tocar no verde-sólido reservado a "confirmar".
  - **Chat**: nova opção "Apagar" na própria mensagem (com confirmação),
    com reversão e toast se a BD recusar.
  - **Mealheiro**: com menos de 5 jogos mostra uma lista compacta
    "jogo → saldo" em vez do gráfico de linha completo (uma linha entre
    menos de 5 pontos não é tendência nenhuma).
  - **Jogador**: "Posição" e "Equipas automáticas" passam a `ExpandableCard`,
    reduzindo os blocos sempre visíveis antes da lista de presença.
  - **Admin**: Dívidas/Histórico passam a usar o mesmo estilo de abas
    (`.tabs`/`.tab`) que Jogo/Equipas/Jogadores/Gerir, acabando com os dois
    sistemas de navegação diferentes; confirmar a própria presença
    (banner + botões + posição) passa a `ExpandableCard`, deixando de
    duplicar sempre o `PlayerView` e empurrar a gestão para depois do
    scroll.
  - Fase 4 (ícone Android desfocado, mais críticas de design, 4
    funcionalidades novas) feita a seguir — ver entrada própria acima.

**26/09/2026:**
- **Gráfico do mealheiro corrigido** — somava só jogos, ignorava pagamentos
  avulsos; e usava a data errada (do jogo, não do pagamento). Como bónus,
  isto também resolveu sozinho o achado "duas fontes de verdade para o
  saldo" (gráfico e cartão já não podem divergir).
- **Cores fora do sistema, corrigidas em vários ecrãs**: cartão do mealheiro
  (turquesa→verde), separador do admin (deixou de roubar o verde de
  "confirmar"), cores das Equipas B/C (deixaram de usar azul-GR e âmbar),
  2 usos indevidos do azul-GR em Zona, link "Já tenho conta" na landing.
- **172 cinzentos fora da paleta** trocados pelos 2 tokens oficiais, em toda
  a app.
- **Regra do Ouro Raro corrigida** no jogador e no admin — a contagem
  decrescente é agora o único dourado por ecrã (cartão de notificações,
  cartão de MVP e banner de convite passaram a neutros).
- **Bordas de equipas**: 2px → 1px, alinhado com a regra do sistema.
- **Chat: falha silenciosa ao enviar mensagem**, corrigida (mesmo padrão do
  voto MVP: verificar erro, reverter, avisar).
- **Admin: aviso "faltam guarda-redes"** já não fica escondido atrás de
  "lotação quase completa".
- **`PiggyBankCard` "duas paletas" — resolvido de graça**: quando o cartão
  hero passou a verde (ver acima), ficou com as mesmas cores do compacto.
- **Chat: botão de enviar** fica visualmente desabilitado com o campo vazio.
- **Landing (fallback `index.html`)**: listas "O que faz"/"Como funciona"
  deixam de usar bullets/numeração nativos do browser.
- **Landing (página real, `LandingView`) reformulada**: CTA sobe para antes
  do mockup (hipótese principal para a conversão a frio ser zero); linha
  "Sem instalar"; funcionalidades como benefícios em vez de nomes; prova
  social real (27 jogadores do grupo 37); contador do mockup animado.
- **Landing (fallback `index.html`)**: splash com Bebas Neue em vez de Arial
  Black; contraste do rodapé corrigido.
