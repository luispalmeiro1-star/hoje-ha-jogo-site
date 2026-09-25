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
  texto-apagado: "#565c4d"
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

## Overview

**Creative North Star: "O marcador do pavilhão"**

Algarismos dourados sobre preto, maiúsculas condensadas, números grandes que se
leem do outro lado do campo. A app não decora informação — expõe-a como um
marcador expõe o resultado. A contagem decrescente `4D 21H`, o `4/12` de
confirmados e o mealheiro em euros são os elementos mais fortes de cada ecrã, e
é assim que deve continuar a ser: quem abre a app quer saber um número, e o
número está lá antes de qualquer texto.

A densidade é alta e deliberada. O corpo de texto vive entre os 11 e os 13px, as
etiquetas descem aos 9 e 10 em maiúsculas espaçadas, e os números sobem aos 28 e
mais. Esse contraste — informação apertada, números enormes — é a assinatura do
sistema. Nada aqui respira como uma landing page; respira como um painel que se
consulta de passagem, com uma mão, no balneário ou no autocarro.

O fundo é quase preto com um desvio verde (`#0a0b08`), não cinzento neutro. É a
única concessão atmosférica do sistema, e chega: o resto da personalidade vem do
dourado, da condensada e dos números.

**Key Characteristics:**
- Números antes de palavras, sempre
- Dourado raro, verde para estado, vermelho para dívida
- Maiúsculas condensadas nas etiquetas e nos marcadores
- Superfícies separadas por tom e linha fina, nunca por moldura pesada
- Densidade alta: desenhado para telemóvel, uma mão, pouca atenção

## Colors

Uma paleta de campo à noite: preto esverdeado em baixo, dourado de troféu no que
interessa, e verde e vermelho a fazer o trabalho de dizer como estão as coisas.

### Primary
- **Ouro de troféu** (`#d4af37`): a cor da marca e da urgência. Vive na contagem
  decrescente, no botão principal de cada ecrã e no logótipo. É a cor que diz
  "olha para aqui" — e só funciona porque é rara.

### Secondary
- **Verde confirmado** (`#4ade80`): estado positivo — presença confirmada,
  pagamento feito, saldo do mealheiro. Aparece em texto e em chips, sobre fundos
  escuros.
- **Verde sólido** (`#1ea851`): o verde cheio do botão "confirmar presença" e das
  barras de progresso. É acção, não estado.

### Tertiary
- **Vermelho de dívida** (`#f87171`): quem deve, o que falta pagar, avisos.
- **Âmbar de aviso** (`#d97706`): "sem resposta" e situações por resolver, entre o
  bem e o mal.
- **Azul de guarda-redes** (`#2563eb`): reservado à posição de GR. Não é uma cor
  de sistema; é um código do jogo.

### Neutral
- **Fundo de campo** (`#0a0b08`): o chão de toda a app. Preto com desvio verde.
- **Superfície** (`#14160f`): cartões, painéis e campos, um degrau acima do fundo.
- **Linha** (`#23271b`): a cor mais usada de todas (149 ocorrências) — bordas de
  1px e divisórias. É ela que desenha a estrutura.
- **Branco** (`#ffffff`): texto principal e números.
- **Texto suave** (`#8a9080`): legendas, ajudas e texto secundário.
- **Texto apagado** (`#565c4d`): rodapés e notas de pé.

### Named Rules

**A Regra do Ouro Raro.** O dourado ocupa no máximo um elemento por ecrã: ou a
contagem decrescente, ou o botão principal. Dois dourados no mesmo ecrã anulam-se
e nenhum chama a atenção. Estado nunca é dourado — estado é verde, âmbar ou
vermelho.

**A Regra das Três Respostas.** Presença tem exactamente três cores: verde para
quem vai, vermelho ou cinzento para quem não vai, âmbar para quem não respondeu.
Nunca duas delas com o mesmo tom.

## Typography

**Display Font:** Bebas Neue (com Impact e cursive como recurso)
**Body Font:** DM Sans (com sans-serif como recurso)

Ambas carregadas por `@import` do Google Fonts em `src/App.jsx`.

**Character:** Uma condensada de cartaz contra uma geométrica limpa. A Bebas só
aparece em maiúsculas — marcadores, etiquetas, o logótipo — e é ela que dá o som
de pavilhão. A DM Sans trata de tudo o que se lê a sério, e aguenta bem os
tamanhos pequenos e apertados que esta app exige.

### Hierarchy
- **Marcador** (Bebas, 28–52px, entrelinha 1, espaçamento 1px): contagens
  decrescentes, saldos, o logótipo. É o elemento mais alto de cada ecrã.
- **Título** (DM Sans 800, 20px): nomes de grupo, cabeçalhos de secção.
- **Subtítulo** (DM Sans 700–800, 14–18px): cabeçalhos dentro de cartões, botões.
- **Corpo** (DM Sans 400–600, 11–13px): a maior parte do texto da app.
- **Etiqueta** (Bebas ou DM Sans 800, 9–11px, maiúsculas, espaçamento 2px):
  `GRUPO`, `PRÓXIMO JOGO`, `CONFIRMADOS`, `MEALHEIRO`.

### Named Rules

**A Regra da Etiqueta Muda.** Etiquetas em maiúsculas espaçadas são sempre texto
suave (`#8a9080`) ou apagado, nunca branco e nunca dourado. Servem para dizer o
que o número é, não para competir com ele.

**A Regra dos Onze.** 11px é o tamanho de corpo por defeito desta app (112
ocorrências) e 13px o máximo confortável. Texto maior do que isso só se for
título ou número.

## Layout

Coluna única, largura máxima de 320px nos blocos de acção centrais, com o resto a
ocupar a largura do telemóvel. Sem grelha de várias colunas — a app é vertical do
princípio ao fim, e as únicas divisões horizontais são pares de botões lado a
lado (`display:flex`, `gap:10`).

O ritmo vem de uma escala pequena: 7, 10, 14 e 16px são os espaçamentos de
trabalho. Cartões com 14px de preenchimento interno; distância entre cartões de
10 a 14px. Navegação fixa no fundo com quatro separadores (Jogo, Finanças, Stats,
Perfil).

Não há comportamento responsivo digno desse nome: foi desenhada para telemóvel e
é isso que serve bem. Em ecrãs largos o conteúdo fica centrado, não se reorganiza.

## Elevation & Depth

**O que está implementado hoje:** sistema plano. Duas sombras em cerca de 5300
linhas de código. A profundidade vem inteiramente de camadas de tom — fundo
`#0a0b08`, superfície `#14160f` — e de linhas de 1px em `#23271b`.

**Decisão do utilizador (setembro de 2026):** o achatamento não foi intenção, foi
acaso, e há vontade de introduzir algum relevo. Isto é direcção nova, não estado
extraído: até haver implementação, o sistema plano continua a ser a verdade.

### Shadow Vocabulary (proposto, ainda não implementado)
- **Levantado** (`box-shadow: 0 2px 8px rgba(0,0,0,0.45)`): cartões que são
  accionáveis — o cartão do próximo jogo, os cartões de acção do admin.
- **Flutuante** (`box-shadow: 0 8px 24px rgba(0,0,0,0.6)`): menus, folhas que
  sobem do fundo, diálogos.
- **Aceso** (`box-shadow: 0 0 0 2px rgba(212,175,55,0.35)`): foco de teclado e
  estado seleccionado, em vez de mudar a cor da borda.

### Named Rules

**A Regra da Sombra Justificada.** Uma sombra tem de significar que o elemento se
pode tocar ou que está por cima de outra coisa. Sombra decorativa em superfícies
paradas é proibida — foi assim que a app chegou aqui sem nenhuma, e o relevo que
se acrescentar não deve desfazer isso.

## Shapes

Cantos suaves e consistentes, sem exageros: 8px em elementos pequenos, 10 e 12px
na maioria dos cartões, 14px nos botões grandes, 20px em painéis largos, e
totalmente redondo (`99px`) apenas em chips de estado e avatares.

As bordas são sempre de 1px e quase sempre `#23271b`. Quando um elemento está
activo ou seleccionado, a borda ganha cor (verde, dourado ou azul) mantendo a
mesma espessura — a app nunca engrossa uma borda para mostrar estado.

Avatares são círculos de 17 a 34px com as iniciais em branco sobre uma cor
atribuída por jogador.

## Components

### Buttons
- **Shape:** cantos suaves (14px nos botões de página inteira, 12px dentro de cartões)
- **Primário:** fundo dourado (`#d4af37`) com texto quase preto (`#0a0b08`), peso 800, 16px de preenchimento. Um por ecrã.
- **Confirmar:** fundo verde sólido (`#1ea851`) com texto escuro — reservado à acção de confirmar presença, que é o gesto central da app.
- **Secundário:** fundo de superfície (`#14160f`) com borda de linha (`#23271b`) e texto branco. Mesma forma do primário, sem cor.
- **Fantasma:** sem fundo nem borda, texto verde (`#22c55e`) a 12px — "Já tenho conta → Entrar".
- **Destrutivo:** texto ou borda em vermelho (`#dc2626`), nunca fundo vermelho cheio.

### Chips (estado)
- **Style:** totalmente redondos, fundo de superfície ou cor a 10–12% de opacidade, borda de 1px na mesma cor a 40%, texto na cor cheia, 11–12px peso 700.
- **State:** verde para confirmados, âmbar para sem resposta, vermelho para dívida. Com um ponto de 6px à esquerda, na mesma cor.

### Cards / Containers
- **Corner Style:** 10–12px
- **Background:** superfície (`#14160f`) sobre o fundo de campo
- **Shadow Strategy:** nenhuma hoje; ver Elevation & Depth
- **Border:** 1px `#23271b`
- **Internal Padding:** 14px

### Inputs / Fields
- **Style:** fundo de superfície, borda de 1px `#23271b`, cantos de 10px, texto branco.
- **Focus:** hoje a borda muda de cor; a regra proposta é o anel dourado `Aceso`.

### Navigation
- **Style:** barra fixa no fundo com quatro separadores, ícone em emoji e legenda de 9–10px. O separador activo fica dourado; os restantes em texto suave. Os separadores com novidades levam um ponto vermelho no canto do ícone.

### Marcador (componente de assinatura)
O bloco `PRÓXIMO JOGO` / `FALTAM 4D 21H` é o componente que define esta app: uma
etiqueta muda em maiúsculas espaçadas, a data e o local em texto pequeno à
esquerda, e a contagem decrescente em Bebas dourado a 28px ou mais à direita.
Sempre que houver um número que importa — confirmados, saldo, jogos da época —
deve usar esta forma.

## Do's and Don'ts

### Do:
- **Do** pôr o número antes da frase. Se um ecrã responde a uma pergunta com um número, esse número é o elemento maior do ecrã.
- **Do** separar superfícies com tom (`#0a0b08` → `#14160f`) e linha de 1px (`#23271b`).
- **Do** usar maiúsculas condensadas com 2px de espaçamento nas etiquetas, sempre em texto suave.
- **Do** manter o corpo de texto a 11–13px; esta app é densa de propósito.
- **Do** dar cor à borda para mostrar estado, mantendo a espessura de 1px.

### Don't:
- **Don't** usar dourado para estado, nem pôr dois elementos dourados no mesmo ecrã.
- **Don't** engrossar bordas para destacar algo.
- **Don't** acrescentar sombras decorativas a superfícies paradas — só a elementos accionáveis ou que estejam por cima de outros.
- **Don't** introduzir uma terceira família tipográfica. Bebas para marcadores e etiquetas, DM Sans para tudo o resto.
- **Don't** usar o azul (`#2563eb`) para nada que não seja a posição de guarda-redes.
- **Don't** reorganizar em várias colunas em ecrãs largos; a app é uma coluna e é isso que a mantém legível com uma mão.
