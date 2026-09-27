---
target: MVP+Perfil+Stats
total_score: 21
max_score: 40
na_heuristics: 
p0_count: 3
p1_count: 5
target_identity: "file:/home/user/hoje-ha-jogo-site/MVP+Perfil+Stats"
timestamp: 2026-09-27T22-14-24Z
slug: mvp-perfil-stats
---
**Method: dual-agent (A: af67e9d779cdebf5a · B: a94be618496110274)**

Crítica combinada a 3 alvos: Votação MVP (`MvpVote`/`MvpCountdownBadge`), Perfil (`ProfileView`), Stats pessoal/época (`StatsView`+`HistoricoPessoalCard`+`BadgesCard`+`GraficoPresencas`+`GraficoRanking`+`SeasonStatsCard`).

Detector CLI (`impeccable detect`) limpo para este alvo (0 achados nas gamas de linhas revistas). Visualização no browser não tentada — ecrãs autenticados sem sessão de demonstração disponível neste ambiente; achados vêm de leitura de código.

## 1. Votação MVP — 27/40 (Aceitável, 68%)

Veredito: o mais específico dos três — o comentário no código sobre manter a própria linha visível (para não perder de vista se ganhaste) é raciocínio de produto real, não genérico.

[P2] Lista de candidatos sem ordenação (por nome ou por votos) — em grupos de 10-15 jogadores obriga a percorrer a lista toda.
[P2] Botão "Retirar voto" com alvo de toque ~23px (padding 5px 10px, fonte 11px) — abaixo do mínimo de toque.
[P3] Em lado nenhum se diz que o voto é secreto, apesar de ser uma promessa do produto.

## 2. Perfil — 15/40 (Pobre, 38%)

Veredito: nove secções empilhadas sem hierarquia (identidade, stats, cor do avatar, editar dados, código do grupo, trocar de grupo, trocar de conta, reportar bug, redes sociais) — a ação mais sensível (mudar password) tem o mesmo peso visual que seguir nas redes sociais.

[P0] `updateProfile` nunca verifica o erro do Supabase nem reverte o estado otimista — uma gravação falhada mostra sempre "Perfil atualizado ✓". O upload do avatar é pior: sem verificação de erro nenhuma, seguido de `window.location.reload()` incondicional.
[P0] `GroupCodeCard` sozinho põe até 4 elementos dourados no mesmo ecrã (selo de editar avatar, texto do código, botão "Copiar", botão "Partilhar") — viola a Regra do Ouro Raro.
[P1] "Trocar de conta" dispara logout imediato sem confirmação, mesmo por baixo de dois botões inofensivos de forma idêntica.
[P1] Sem cabeçalhos de secção (ao contrário do resto da app, que usa etiquetas maiúsculas) — nove blocos misturados sem agrupamento.
[P2] Autocolantes de cor do avatar são círculos de 32px sem padding — abaixo do alvo de toque mínimo, e cada toque grava de imediato sem confirmação.
[P3] Botões só com ícone sem `aria-label` (voltar, foto, mostrar password, cores de avatar).

## 3. Stats pessoal/época — 20/40 (Aceitável, 50%)

Veredito: o sistema de badges (5/10/25/50 jogos) é gamificação genérica colada por cima, sem nenhum badge ligado a um evento real de futebol.

[P0] Dourado reutilizado como cor de ESTADO (proibido pelo DESIGN.md): aba ativa, badges "conquistado", chip de MVP da época, ponto "isMe" no gráfico de ranking.
[P1] Verde-sólido (reservado a "confirmar presença") reutilizado no tile "Jogos", na linha do gráfico de presenças e no ponto por omissão do ranking; azul-guarda-redes reutilizado no tile "Presença", sem ligação ao guarda-redes.
[P1] `BadgesCard` devolve `null` para um jogador com 0 jogos — a secção "Conquistas" desaparece por completo, em vez de mostrar um estado vazio como os outros cartões da mesma página.
[P2] Leitura de `season_stats` sem verificar erro — uma falha de rede fica indistinguível de "não há épocas anteriores".
[P2] 10 ocorrências de texto a 9-10px, abaixo do próprio mínimo do sistema (etiqueta = 11px).

**Prioridade seguinte, se quiseres continuar depois desta ronda**: reestruturar o Perfil em secções com cabeçalhos; ordenar a lista de votação MVP.
