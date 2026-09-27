# Por fazer

Lista de trabalho pendente na app Hoje Há Jogo. As ideias vindas de apps
concorrentes estão em `IDEIAS-CONCORRENCIA.md`; aqui estão as coisas nossas.

Relatórios completos das críticas de design (`/impeccable critique`) ficam em
`.impeccable/critique/` — esta lista só resume o que ainda falta fazer.

---

## Por fazer agora

Nada urgente. Fica registado abaixo um levantamento (27/09/2026) de todos os
outros comandos do `/impeccable` — dois achados por comando — para quando
houver vontade de continuar a polir a app. Os concretos e de baixo risco já
foram aplicados (ver "Já feito"); os que ficam aqui exigem uma decisão ou
mais trabalho do que valia a pena fazer sem confirmar primeiro.

### `harden` (produção a sério)
- `resetGame` (fecho do jogo) faz uma dúzia de escritas seguidas na BD sem
  transação — se a rede cair a meio, fica em estado inconsistente.
- Vários carregamentos de dados (`loadHistory`, `loadDebts`, `loadMessages`,
  `loadAttendance`) ignoram erro da leitura — falha silenciosamente,
  deixando os dados desatualizados até à próxima tentativa. Risco menor que
  os erros de escrita já todos corrigidos, por isso não mexi.

### `optimize` (performance)
- O ficheiro final da app já passa de 1MB comprimido (o próprio `vite
  build` avisa) — para quem tem dados móveis fracos, é tempo de espera a
  mais no arranque.
- A biblioteca de gráficos (Recharts) carrega sempre, mesmo para quem nunca
  abre "Stats" — dava para só carregar quando é preciso. Não fiz por ser
  uma alteração de risco a mais para o benefício, sem poder testar ao vivo.

### `adapt` (ecrãs diferentes)
- A app é só telemóvel por desenho (documentado no `DESIGN.md`) — nada a
  mudar aí.
- Não testei em telemóveis muito antigos/pequenos (320px) — o título da
  landing foi medido para 360px; abaixo disso pode partir a linha de forma
  menos elegante. Precisava de um ecrã real para confirmar.

### `distill` (reduzir ao essencial)
- Nada a cortar a nível visual — a app já é densa por desenho, documentado.
- O Perfil, mesmo depois de dividido em secções, ainda mistura conta/grupo
  com suporte/redes sociais na mesma página — dava para separar.

### `colorize`, `quieter`, `delight`
- Nada urgente em nenhum dos três: a app já usa cor com intenção, já é
  contida por desenho, e já tem alguns toques de celebração (ex: aviso
  quando alguém entra por vaga aberta).

### `overdrive`
- Não recomendado para esta app — o sistema é deliberadamente contido (uma
  cor rara, sem sombras decorativas, densidade controlada); "ultrapassar
  limites convencionais" iria contra a própria identidade do `DESIGN.md`.

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
  - **Não fiz**, por pedirem confirmação ou um ambiente de teste que não
    tenho aqui: transação na `resetGame` (harden), tratamento de erro nos
    `load*` de leitura (harden), carregar o Recharts só quando preciso
    (optimize — mudança estrutural ao ficheiro, risco de partir a build
    sem poder testar ao vivo), testar em ecrãs de 320px (adapt), separar
    o Perfil em conta/suporte (distill). Continuam registados acima em
    "Por fazer agora".
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
