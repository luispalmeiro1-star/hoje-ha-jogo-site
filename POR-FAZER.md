# Por fazer

Lista de trabalho pendente na app Hoje Há Jogo. As ideias vindas de apps
concorrentes estão em `IDEIAS-CONCORRENCIA.md`; aqui estão as coisas nossas.

---

## 1. Corrigir o gráfico do mealheiro (Stats → Grupo)

**Reportado pelo Luís a 25/09/2026, com captura de ecrã. Está errado, não é só
feio.**

O que o ecrã mostra hoje:

- Um gráfico de linha **"Evolução do saldo (€)"** de 16/09 a 23/09, com o eixo
  vertical de 0 a 8, a descer de ~7 para 5.
- Por baixo, um cartão azul com **"SALDO ATUAL +23€"**, e ao lado
  *total recebido +69€*, *pago em aluguer −46€*, *jogos 2*.

**O problema é evidente sem ver o código: o gráfico diz 5€ e o cartão diz 23€,
no mesmo ecrã e para a mesma coisa.** Uma das duas contas está errada, ou então
estão a medir coisas diferentes com o mesmo nome — e nesse caso o nome é que
está errado. 69 − 46 = 23, portanto o cartão fecha; a linha é que não bate
certo com nada.

Duas hipóteses a verificar no código antes de mexer:

1. O gráfico usa outra fonte de dados (pagamentos individuais? só uma semana?) e
   nunca foi ligado à mesma conta que o cartão.
2. O gráfico está certo para o que mede, mas a legenda mente — se for "saldo
   por jogo" ou "saldo naquela data", tem de o dizer.

**Decidir também se o gráfico fica.** Com 2 jogos há dois pontos, e uma linha
entre dois pontos não é uma evolução — é um traço. Alternativas a ponderar:

- Barras por jogo (recebido vs. custo), que com poucos dados ainda se lê.
- Nada de gráfico: só os números do cartão, que são os que interessam, mais o
  detalhe no mealheiro.
- Manter a linha, mas só a partir de 4 ou 5 jogos, e mostrar os números até lá.

O Luís disse: *"Corrigir este gráfico, ou mudar para outro tipo de gráfico.
Não está correto sequer."* A correcção da conta é obrigatória; a mudança de
formato é decisão dele depois de ver a conta certa.

Antes de desenhar seja o que for, ler a skill `dataviz` — e o `DESIGN.md`, que
já diz que o azul (`#2563eb`) está reservado à posição de guarda-redes. Este
cartão azul não respeita isso.

---

## 2. Ecrã de novidades dentro da app

Ninguém soube do botão "não vou", do voto secreto no MVP, do lembrete da manhã
do jogo nem do grupo de demonstração. Ver `IDEIAS-CONCORRENCIA.md`.

## 3. Apagar mensagens do chat (admin)

Hoje não há nada a fazer se entrar spam num grupo. Ver
`IDEIAS-CONCORRENCIA.md`.

## 4. Cor e nome por equipa

Resolve a confusão de quem é dos coletes. Ver `IDEIAS-CONCORRENCIA.md`.

## 5. Estado "lesionado" no perfil

Evita mandar lembretes semanais a quem está a recuperar. Ver
`IDEIAS-CONCORRENCIA.md`.

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
