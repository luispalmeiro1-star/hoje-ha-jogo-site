# Por fazer

Lista de trabalho pendente na app Hoje Há Jogo. As ideias vindas de apps
concorrentes estão em `IDEIAS-CONCORRENCIA.md`; aqui estão as coisas nossas.

Relatórios completos das críticas de design (`/impeccable critique`) ficam em
`.impeccable/critique/` — esta lista só resume o que ainda falta fazer.

---

## Por fazer agora

### Ícone grande e desfocado ao abrir a app pela primeira vez (reportado 27/09/2026)

**O Luís (Android) reportou:** ao abrir a app a partir do ícone no ecrã
principal, aparece o símbolo da app em grande, desfocado — antes do ecrã de
arranque com o texto "HOJE HÁ JOGO" que já ajustámos (esse é texto, não é
isto). É o ecrã de lançamento automático que o próprio telemóvel constrói a
partir do ícone da app, não um ecrã nosso.

**Investigação feita:** `vite.config.js` declara `icon-192.png` e
`icon-512.png` para o manifest PWA (ambos com o tamanho real correto,
confirmado por ficheiro). `index.html` só liga um `apple-touch-icon` de
192px — isso explicaria o problema **no iOS** (ícone pequeno ampliado pelo
sistema), mas **o Luís é Android**, por isso essa causa não se aplica
diretamente a ele. **Falta investigar amanhã** a causa específica do
comportamento no Android antes de propor correção — não assumir que é a
mesma coisa. Hipóteses a verificar: falta de `"purpose":"maskable"` nos
ícones do manifest, o conteúdo do próprio ícone ter um efeito suave/desfocado
de propósito (ver a imagem antes de mexer), ou outra causa específica do
ecrã de lançamento do Android/Chrome.

### Outros achados de design ainda por implementar

Todos os itens desta secção foram implementados em 27/09/2026 — ver
"Já feito" mais abaixo (Fases 1-3).

### Críticas de design por fazer

- **Lote 2**: Votação MVP, Perfil, Stats pessoal/época
- **Lote 3**: Admin — abas Equipas, Jogadores, Gerir

### Funcionalidades novas (ver `IDEIAS-CONCORRENCIA.md`)

1. **Ecrã de novidades dentro da app** — ninguém sabe do "não vou", voto
   secreto do MVP, lembrete da manhã, grupo de demonstração.
2. **Apagar mensagens do chat** (moderação do admin) — hoje não há nada a
   fazer se entrar spam num grupo.
3. **Cor e nome por equipa** (configurável pelo admin) — resolve a confusão
   de quem é dos coletes. Diferente da correção de cor já feita (essa só
   tirou o azul/âmbar reservados; isto é deixar o admin escolher).
4. **Estado "lesionado" no perfil** — evita lembretes semanais a quem está a
   recuperar.

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

---

## Já feito

Registo condensado — detalhe completo nos relatórios em
`.impeccable/critique/` e no histórico de commits de `hoje-ha-jogo`.

**27/09/2026:**
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
    funcionalidades novas) fica para depois — ver secções abaixo.

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
