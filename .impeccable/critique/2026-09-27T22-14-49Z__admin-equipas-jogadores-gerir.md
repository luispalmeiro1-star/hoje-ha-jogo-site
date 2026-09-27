---
target: Admin-Equipas+Jogadores+Gerir
total_score: 20
max_score: 40
na_heuristics: 
p0_count: 2
p1_count: 5
target_identity: "file:/home/user/hoje-ha-jogo-site/Admin-Equipas+Jogadores+Gerir"
timestamp: 2026-09-27T22-14-49Z
slug: admin-equipas-jogadores-gerir
---
**Method: dual-agent (A: a3820f0457acb3068 · B: abbe59fb6ca77d83d)**

Crítica combinada a 3 alvos: Admin — abas Equipas, Jogadores e Gerir (dentro de `AdminView`).

Detector CLI (`impeccable detect`) limpo para este alvo (0 achados nas gamas de linhas revistas — o detetor só cobre um anti-padrão de transições de layout, presente noutras partes do ficheiro). Visualização no browser não tentada — ecrãs de admin autenticados sem sessão de demonstração disponível neste ambiente; achados vêm de leitura de código.

## 1. Equipas — 24/40 (Aceitável, 60%)

Veredito: foco genuíno (sorteio, mover jogador, declarar vencedor, código do grupo). A escolha das cores de equipa evita deliberadamente as cores reservadas (comentário no código a provar isso) — mas o resto do ecrã não segue a mesma disciplina.

[P1] "Qual foi a equipa vencedora?" (banner do último jogo, aba Jogo) usa azul-guarda-redes; a mesma ação dentro da aba Equipas usa âmbar — duas linguagens de cor diferentes para a mesma ação.
[P2] `GroupCodeCard` repetido no fundo da aba Equipas, duplicando o código já visível no banner dourado do topo — segundo elemento dourado no mesmo ecrã.

## 2. Jogadores — 18/40 (Pobre, 45%)

Veredito: o botão que mostra "✅ Dentro" parece uma etiqueta de estado, mas um toque muda mesmo a presença de outra pessoa — sem confirmação nenhuma.

[P0] Alternar a presença de um jogador (botão de estado na lista) não tem confirmação: um toque muda o "vou/não vou" de outra pessoa, limpa o pagamento e pode promover alguém da lista de espera — tudo em silêncio.
[P0] Remover jogador (ícone de lixo) não tem confirmação nenhuma — ao contrário de ações equivalentes ou menos graves no resto do ficheiro (sair do grupo, apagar mensagem, terminar época), que pedem sempre confirmação.
[P1] Alvo de toque do botão de presença tem `fontSize:10` embutido — o mais pequeno do ecrã (~20px).
[P2] Sem estado vazio quando não há jogadores (a aba Histórico, ao lado, já trata este caso).
[P2] Campos de "Adicionar Membro" e nomes de equipa só têm `placeholder`, sem etiqueta visível — desaparece assim que se escreve.

## 3. Gerir — 19/40 (Pobre, 48%)

Veredito: secção "Configurações" é um único formulário com ~40 controlos por baixo de um só botão "GUARDAR" — o oposto do "no máximo 4 por decisão" que o resto da app respeita.

[P1] Verde-sólido (reservado a "confirmar presença") reutilizado como cor de seleção genérica em 5 sítios: dias da semana, tipo de jogo, máximo de jogadores, reatribuição automática, botão "Revelar equipas".
[P1] Três cartões dourados independentes podem aparecer ao mesmo tempo nesta aba (banner de convite, pedidos pendentes, pedidos de reposição de password) — o dourado deixa de ser raro.
[P1] Gravar definições e gravar o número MBWay não verificam o erro do Supabase — uma falha mostra sempre "Guardado ✓".
[P2] Quatro botões de notificação usam 4 cores novas e sem ligação ao resto do sistema (ciano, laranja, roxo, mais o verde já usado) — em vez de reutilizar cores já adotadas noutros sítios da app.
[P3] Alvos de toque pequenos nos botões de equipa vencedora, máximo de jogadores e dias da semana (28-36px).

**Prioridade seguinte, se quiseres continuar depois desta ronda**: dividir "Configurações" em secções mais pequenas com gravação própria.
