---
name: Hoje Há Jogo
description: O marcador do pavilhão — dourado sobre preto, números que se leem de longe.
colors:
  ouro: "#d4af37"
  fundo-campo: "#0a0b08"
  superficie: "#14160f"
  linha: "#23271b"
  texto: "#ffffff"
  texto-suave: "#8a9080"
  texto-apagado: "#7d8472"
  verde-confirmado: "#4ade80"
  verde-solido: "#1ea851"
  verde-escuro: "#04240f"
  vermelho-divida: "#f87171"
  vermelho-forte: "#dc2626"
  ambar-aviso: "#d97706"
  azul-guarda-redes: "#2563eb"
typography:
  marcador:
    fontFamily: "'Bebas Neue', Impact, cursive"
    fontSize: "28px"
    fontWeight: 400
    lineHeight: 1
    letterSpacing: "1px"
  titulo:
    fontFamily: "'DM Sans', sans-serif"
    fontSize: "20px"
    fontWeight: 800
    lineHeight: 1.2
  corpo:
    fontFamily: "'DM Sans', sans-serif"
    fontSize: "13px"
    fontWeight: 400
    lineHeight: 1.5
  etiqueta:
    fontFamily: "'Bebas Neue', Impact, cursive"
    fontSize: "11px"
    fontWeight: 400
    letterSpacing: "2px"
rounded:
  sm: "8px"
  md: "10px"
  lg: "12px"
  xl: "14px"
  pilula: "99px"
spacing:
  xs: "7px"
  sm: "10px"
  md: "14px"
  lg: "16px"
components:
  botao-primario:
    backgroundColor: "{colors.ouro}"
    textColor: "{colors.fundo-campo}"
    rounded: "{rounded.xl}"
    padding: "16px"
    typography: "{typography.titulo}"
  botao-secundario:
    backgroundColor: "{colors.superficie}"
    textColor: "{colors.texto}"
    rounded: "{rounded.xl}"
    padding: "16px"
  botao-confirmar:
    backgroundColor: "{colors.verde-solido}"
    textColor: "{colors.fundo-campo}"
    rounded: "{rounded.lg}"
    padding: "16px"
  cartao:
    backgroundColor: "{colors.superficie}"
    textColor: "{colors.texto}"
    rounded: "{rounded.lg}"
    padding: "14px"
  chip-estado:
    backgroundColor: "{colors.superficie}"
    textColor: "{colors.verde-confirmado}"
    rounded: "{rounded.pilula}"
    padding: "7px 14px"
---

# Design System: Hoje Há Jogo

<!-- impeccable:design-map -->
Name: Hoje Há Jogo
Colors: primary: ouro #d4af37; secondary: verde-confirmado #4ade80; tertiary: vermelho-divida #f87171; neutral: fundo-campo #0a0b08; secondary: verde-solido #1ea851; tertiary: ambar-aviso #d97706 (+4 more in the sidecar)
Fonts: Bebas Neue (marcador, etiqueta); DM Sans (titulo, corpo)
Spacing: xs 7px, sm 10px, md 14px, lg 16px
Radius: sm 8px, md 10px, lg 12px, xl 14px, pilula 99px
North Star: "O marcador do pavilhão"
Elevation:
- Levantado: 0 2px 8px rgba(0,0,0,0.45)
- Flutuante: 0 -8px 24px rgba(0,0,0,0.6)
- Aceso: 0 0 0 2px rgba(212,175,55,0.6)
Don't:
- Don't usar dourado para estado, nem pôr dois elementos dourados no mesmo ecrã.
- Don't engrossar bordas para destacar algo.
- Don't acrescentar sombras decorativas a superfícies paradas — só a elementos accionáveis ou que estejam por cima de outros.
- Don't introduzir uma terceira família tipográfica.
- Don't usar o azul (`#2563eb`) para nada que não seja a posição de guarda-redes.
- Don't reorganizar em várias colunas em ecrãs largos; a app é uma coluna e é isso que a mantém legível com uma mão.
Do:
- Do pôr o número antes da frase.
- Do separar superfícies com tom (`#0a0b08` → `#14160f`) e linha de 1px (`#23271b`).
- Do usar maiúsculas condensadas com 2px de espaçamento nas etiquetas, sempre em texto suave.
- Do manter o corpo de texto a 11–13px; esta app é densa de propósito.
- Do dar cor à borda para mostrar estado, mantendo a espessura de 1px.
Full: .impeccable/design-full.md (read a section when you need its detail)
