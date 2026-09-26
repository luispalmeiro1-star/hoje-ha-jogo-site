---
target: Equipas + ChatView + ZonaView
total_score: 71
max_score: 120
na_heuristics: 
p0_count: 3
p1_count: 5
target_identity: "file:/home/user/hoje-ha-jogo-site/Equipas+ChatView+ZonaView"
timestamp: 2026-09-26T22-57-23Z
slug: equipas-chatview-zonaview
---
**Method: dual-agent (A: a5de20c306669e0a8 · B: abce91008c4088668)**

Crítica combinada a 3 alvos: Equipas (TeamsReveal+AutoTeamsDisplay), Chat (ChatView), Zona (ZonaView).

## 1. Equipas — 26/40 (Aceitável, 65%)

Veredito: o ritual de sorteio tem personalidade genuína. Mas a cor da Equipa B é literalmente o azul reservado ao guarda-redes.

[P0] TEAM_COLORS[1] usa #2563eb/#60a5fa, a cor reservada ao GR. Um GR na Equipa B fica com o badge de GR (também azul) dentro de um cartão já azul. Corrigir: terceira cor não-azul para Equipa B.
[P1] Terceira equipa usa âmbar, a mesma cor de "sem resposta" no resto da app.
[P1] Bordas de 2px espalhadas pelo componente, contra a regra de 1px.
[P2] Cinzentos fora da paleta em 6 sítios do componente.
[P3] Alvos de toque pequenos no seletor de mover jogador.

## 2. Chat — 22/40 (Aceitável, 55%)

Veredito: genérico, clone do padrão WhatsApp/Messenger sem ligação à identidade da app.

[P0] O indicador de mensagem não lida está morto — as chamadas reais passam sempre unreadChat=false, e Chat nem é um separador do BottomNav. Ninguém é avisado de mensagem nova.
[P1] Falha silenciosa ao enviar mensagem — sendMessage não verifica error nem reverte estado local (ao contrário do voto MVP que já faz isto bem).
[P2] Sem editar/apagar mensagem própria; cinzentos fora da paleta no nome/hora.
[P3] Botão de enviar sem estado desabilitado com input vazio; mensagens longas sem quebra de palavra.

## 3. Zona — 23/40 (Aceitável, 58%)

Veredito: resolve necessidade real, mas é o ecrã que mais se afasta do sistema de cores.

[P0] Azul do GR reutilizado duas vezes para fins alheios ao jogo: caixa de dica e seletor de dias habituais.
[P1] Inconsistência interna: concelho selecionado = verde, dia selecionado = azul.
[P1] Sem validação do contacto WhatsApp.
[P2] Pode ficar disponível sem zona definida; lista de 34 concelhos sem pesquisa nem ordem alfabética.
[P3] Escritas na BD sem tratamento de erro em toggleDay/handleZone.

## Síntese

Regra do Ouro Raro: não se repete aqui. Cinzentos fora da paleta: confirma-se com força em Equipas e Chat. Novo padrão, mais grave que os anteriores: o azul do guarda-redes está a ser usado como cor genérica de "info" ou "seleção" em dois dos três ecrãs (Equipas e Zona) — esvazia o significado de uma cor que já tinha regra exclusiva.
