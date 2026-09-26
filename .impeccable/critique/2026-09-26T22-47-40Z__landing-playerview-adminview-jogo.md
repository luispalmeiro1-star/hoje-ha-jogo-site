---
target: Landing + PlayerView + AdminView(jogo)
total_score: 68
max_score: 96
na_heuristics: varia por ecrã, ver corpo
p0_count: 3
p1_count: 4
target_identity: "file:/home/user/hoje-ha-jogo-site/landing+PlayerView+AdminView(jogo)"
timestamp: 2026-09-26T22-47-40Z
slug: landing-playerview-adminview-jogo
---
**Method: dual-agent (A: a5063c3b082a5eed6 · B: a0eea629288b2514f)**

Crítica combinada a 3 ecrãs: Landing (index.html), PlayerView (confirmação de presença), AdminView aba "Jogo".

## 1. Landing page (index.html) — 15/20 (Bom, 75%)

Heurísticas com nota: correspondência com mundo real 4, consistência 2 (splash Arial Black em vez de Bebas Neue), reconhecimento 3, estética minimalista 3, ajuda/documentação 3.

Achado do detector: contraste insuficiente no rodapé (#565c4d sobre #0a0a0a, 2.9:1, mínimo 4.5:1).

Problemas: [P2] splash usa Arial Black em vez de Bebas Neue; [P2] contraste do rodapé abaixo do minimo AA; [P3] fallback SEO não usa tokens tipográficos; [P3] listas com bullets nativos do browser.

## 2. Ecrã do jogador (PlayerView) — 26/36 (Bom, 72%)

Heurísticas: visibilidade 4, mundo real 4, controlo 3, consistência 2 (cinzentos fora da paleta usados quase o dobro dos oficiais: #6b7280x92, #4b5563x57 vs #8a9080x62, #565c4dx27), prevenção de erros 3, reconhecimento 3, flexibilidade 2, estética 2, ajuda 3.

Veredito: FieldHeader (countdown dourado) é o componente mais bem executado da app, mas o ecrã já não segue a disciplina do próprio DESIGN.md.

Problemas:
[P0] Viola a "Regra do Ouro Raro" do próprio DESIGN.md — countdown dourado + cartão de notificações dourado + cartão MVP dourado podem coexistir no mesmo scroll. Corrigir: mover pedido de notificações para onboarding, ou recolorir.
[P1] Cinzentos fora da paleta usados quase 2x mais que os tokens oficiais — substituir globalmente.
[P1] Carga vertical excessiva antes da lista de presença (6+ blocos condicionais) — recolher chat/zona/posição/equipas em ExpandableCards.
[P2] MBWayButton introduz ciano não documentado, 5a cor de destaque simultânea.
[P3] Botão fica 600ms em "A processar..." sem feedback otimista na lista.

## 3. Admin — aba Jogo (AdminView) — 27/40 (Aceitável, 68%)

Heurísticas: visibilidade 3, mundo real 4, controlo 3, consistência 1 (duas linguagens de separador incompatíveis), prevenção de erros 4 (fechar jogo com confirmação em duas etapas, exemplar), reconhecimento 2, flexibilidade 2, estética 2, recuperação de erros 3, ajuda 3.

Achado mais grave: o BottomNav principal usa dourado para o separador ativo (correto), mas a barra de sub-abas do admin (Jogo/Equipas/Jogadores/Gerir) usa o MESMO verde reservado à ação "confirmar presença" para marcar a aba ativa.

Problemas:
[P0] Duas linguagens de separador incompatíveis (verde de ação roubado pela navegação) — unificar com o BottomNav ou usar verde distinto.
[P0] Até 3 dourados simultâneos, agravado pelo código de convite gigante (48px) — pior justamente no primeiro grupo de um admin novo.
[P1] Confirmar a própria presença duplica a PlayerView e empurra as ferramentas de gestão para depois do scroll.
[P1] Dívidas/Histórico (botões soltos) vs. Equipas/Jogadores/Gerir (abas) — dois sistemas para o mesmo conceito de navegação.
[P2] GroupStatusCard só mostra a mensagem mais otimista — pode esconder "falta guarda-redes" atrás de "quase completo".

## Síntese

Padrão comum aos três ecrãs, mais importante que qualquer achado isolado: o sistema documentado em DESIGN.md é mais disciplinado do que o sistema implementado. Cinzentos fora da paleta, cores de acento não documentadas (MBWay, tab-active), e violações repetidas da própria "Regra do Ouro Raro" — cada componente individualmente até respeita a cor certa, mas nada impede que 2-3 dourados apareçam juntos, ou que uma cor reservada (verde de confirmar) seja reaproveitada na navegação. Não é um problema de um componente — é falta de um "orçamento de cor por ecrã" que se aplique a tudo.
