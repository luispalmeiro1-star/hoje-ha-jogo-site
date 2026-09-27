# Por fazer

Lista de trabalho pendente na app Hoje Há Jogo. As ideias vindas de apps
concorrentes estão em `IDEIAS-CONCORRENCIA.md`; aqui estão as coisas nossas.

Relatórios completos das críticas de design (`/impeccable critique`) ficam em
`.impeccable/critique/` — esta lista só resume o que ainda falta fazer.

---

## Por fazer agora

### Chat: indicador de mensagem não lida está morto (P0, funcional)

**O único achado funcional de todas as críticas feitas até agora — não é só
visual.** As chamadas reais do `BottomNav` passam sempre `unreadChat={false}`,
e o Chat nem é um dos 4 separadores do rodapé (é um botão dentro do ecrã de
Jogo). Ninguém é avisado de mensagem nova a não ser que abra o chat "por
acaso" — mina diretamente o propósito do chat como substituto do WhatsApp.
Precisa de lógica nova (ex.: `last_read_at` por jogador), não só troca de cor.

### Outros achados de design ainda por implementar

- **[P1] Jogador: carga vertical excessiva** antes da lista de presença
  (6+ blocos condicionais) — recolher chat/zona/posição/equipas em
  `ExpandableCard`s.
- **[P1] Admin: confirmar a própria presença duplica o `PlayerView`**, empurra
  as ferramentas de gestão para depois do scroll.
- **[P1] Admin: Dívidas/Histórico (botões soltos) vs. Equipas/Jogadores/Gerir
  (abas)** — dois sistemas de navegação para o mesmo conceito.
- **[P1] `PiggyBankCard` muda de paleta consoante quem o chama** (hero vs.
  compacto) — unificar; se precisar de diferença, que seja de tamanho.
- **[P1] Zona: sem validação do contacto WhatsApp** — número mal escrito só
  se descobre quando alguém tenta contactar e falha.
- **[P2] Simplificar o gráfico do mealheiro** para poucos pontos — lista
  compacta "jogo → saldo" ou sparkline em vez de eixos+tooltip completos.
- **[P2] Jogador: `MBWayButton` introduz ciano não documentado**, 5ª cor de
  destaque simultânea.
- **[P2] Zona: pode ficar "disponível" sem zona definida**; lista de 34
  concelhos sem pesquisa nem ordem alfabética.
- **[P2/P3 vários, baixa prioridade]**: Chat sem editar/apagar mensagem
  própria; landing (fallback SEO) sem tokens tipográficos e bullets nativos;
  botões sem feedback otimista/estado desabilitado em vários sítios; Equipas
  com alvos de toque pequenos; escritas na BD sem tratamento de erro em Zona.

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

## Já feito (26/09/2026)

Registo condensado — detalhe completo nos relatórios em
`.impeccable/critique/` e no histórico de commits de `hoje-ha-jogo`.

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
- **Landing (página real, `LandingView`) reformulada**: CTA sobe para antes
  do mockup (hipótese principal para a conversão a frio ser zero); linha
  "Sem instalar"; funcionalidades como benefícios em vez de nomes; prova
  social real (27 jogadores do grupo 37); contador do mockup animado.
- **Landing (fallback `index.html`)**: splash com Bebas Neue em vez de Arial
  Black; contraste do rodapé corrigido.
