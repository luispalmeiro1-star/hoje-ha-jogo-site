# Product

<!-- impeccable:product-schema 1 -->

## Platform

web

## Users

O utilizador primário é **quem organiza o jogo** — o admin do grupo. É a pessoa
que hoje anda a contar gente pelo WhatsApp, a perguntar "quem joga quarta?", a
cobrar 3€ a cada um e a fazer as equipas. É ela que decide passar o grupo para a
app e que traz os outros atrás.

Os **jogadores** são o segundo público e a maioria dos utilizadores em número,
mas entram sempre por convite de alguém: dizem se vão, veem as equipas, pagam a
sua parte e votam no MVP. Não chegam sozinhos.

Isto está confirmado pelos dados: em 28 dias, das 164 chegadas ao site, as 28 que
traziam convite representam quase toda a conversão; das 136 que chegaram a frio,
3 tocaram num botão e nenhuma criou conta.

## Product Purpose

Tirar da cabeça do organizador o trabalho de juntar gente para o jogo semanal.
O grupo passa a ter um sítio só onde a presença se confirma, a lista se faz
sozinha, as contas ficam à vista e as equipas saem feitas.

Sucesso, para um grupo, é o jogo da semana acontecer sem ninguém ter de andar a
perguntar quem vai.

## Positioning

Quatro diferenças que o produto sustenta hoje:

1. **Ninguém tem de perguntar.** Cada um diz se vai ou não vai; quem fica de fora
   entra em espera e sobe sozinho se alguém desistir; os lembretes saem à hora
   certa sem o admin mexer um dedo.
2. **As contas à vista de todos.** Mealheiro do grupo, quem pagou, quem deve,
   visível para o grupo inteiro e pago por MBWay. O admin deixa de ser cobrador.
3. **Não é preciso instalar nada.** Abre no link, no telemóvel.
4. **É feita para Portugal.** MBWay, euros, português de Portugal, pavilhões,
   futebol de 5 e de 7 — em vez de uma app estrangeira traduzida.

## Operating Context

O ritual é semanal e tem sempre a mesma forma: dias antes marca-se o jogo; a
meio da semana o grupo está meio confirmado e meio calado; na véspera e na manhã
do próprio dia saem os avisos a quem não respondeu; no dia joga-se; a seguir
dividem-se as contas e vota-se no melhor jogador.

Tudo acontece no telemóvel, muitas vezes de passagem — no trabalho, no
transporte, no balneário. O grupo de WhatsApp continua a existir ao lado: é de
lá que as pessoas vêm e é para lá que o link é partilhado.

## Capabilities and Constraints

Funcionalidades confirmadas, em produção:

- **Presenças** com três respostas distintas: vou, não vou, e ainda não
  respondeu — e lista de espera com promoção automática quando abre vaga.
- **Equipas** formadas pela app, com posição por jogador (polivalente, guarda-redes).
- **Pagamentos e dívidas** por MBWay, com mealheiro do grupo e tesoureiro nomeado.
- **Votação de MVP**, secreta: cada um vê quantos votos tem, ninguém vê em quem
  os outros votaram, e não se pode votar em si próprio.
- **Estatísticas** por jogador e por época.
- **Chat** do grupo, **zona** (local do jogo) e **histórico** de jogos.
- **Convidados** — jogadores sem conta, adicionados por um membro.
- **Notificações push** (véspera e manhã do jogo a quem não respondeu, aviso de
  pagamento duas horas antes, dívidas em aberto, pedidos de entrada, MVP).
- **Multi-grupo**: a mesma pessoa pode pertencer a vários grupos.

Constrangimentos duráveis, confirmados pelo utilizador:

- **Só Portugal, por agora.** Euros e MBWay. O Brasil (Pix, reais) é uma hipótese
  em aberto, **não** um facto — não deve ser assumido nem em código nem em copy.
- **Entra-se por convite.** Para entrar num grupo é preciso código, QR Code ou
  link de quem já lá está. Os grupos não são públicos nem pesquisáveis.

Factos actuais que **não** foram declarados duráveis, e que por isso não devem ser
tratados como promessas permanentes nem contrariados por invenção:

- A app é hoje **gratuita, sem publicidade e não vende dados** — está escrito no
  rodapé do site. Nenhum trabalho futuro deve inventar preços, planos ou
  publicidade; mas também não deve escrever que será grátis para sempre.
- A app é hoje uma **PWA que abre no link, sem instalação**. Uma app nativa não
  está excluída; enquanto não houver decisão, o produto é o que está em produção.

## Brand Commitments

- Nome: **Hoje Há Jogo**. Endereço: **hojehajogo.pt**.
- Voz: português de Portugal, primeira pessoa, de quem também joga. Directa, sem
  linguagem de anúncio, sem exageros. Os textos que funcionam contam o que
  aconteceu ao grupo, com números reais, em vez de prometerem benefícios.

## Evidence on Hand

Material real, verificado, que pode ser usado sem inventar nada:

- **Grupo 37, "Futebolada de Quarta-Feira"** — o grupo real do dono do produto:
  27 membros activos; na quarta-feira de 23/09 jogaram 11; a quatro dias do jogo
  estava em 4 confirmados e 19 sem resposta.
- **Grupo 45** — o primeiro grupo criado por alguém sem ligação ao dono.
- **Funil dos últimos 28 dias**: 164 chegadas, 28 com convite, 136 a frio,
  3 toques em botões entre essas 136, 0 contas criadas a frio.
- **Capturas de ecrã reais** da app neste repositório (`screen-*.jpeg`) e no
  directório de trabalho da sessão.

Não existe, e não deve ser fabricado: testemunhos, número de utilizadores ou de
grupos além dos acima, imprensa, prémios, comparações de desempenho, preços.

## Product Principles

1. **O trabalho é da app, não do admin.** Se uma tarefa obriga o organizador a
   perseguir alguém, é um defeito do produto.
2. **Quem chega tem de poder ver antes de decidir.** Pedir a um desconhecido que
   mude o grupo inteiro é o passo mais pesado que existe; não pode ser o único.
3. **O que se promete lá fora é o que se encontra cá dentro.** A mensagem que traz
   a pessoa e o primeiro ecrã que ela vê têm de falar do mesmo problema.
4. **Números reais ou nada.** O produto comunica com o que aconteceu, não com o
   que soa bem.
5. **Cada um responde por si.** A presença, o pagamento e o voto são de quem os
   faz; o admin gere o jogo, não as pessoas.

## Accessibility & Inclusion

Não foi estabelecido nenhum requisito específico de acessibilidade para este
produto. O contexto de uso é telemóvel, muitas vezes com uma mão, em movimento e
com pouca atenção disponível — o que torna alvos de toque generosos, contraste
alto e texto legível a pouca luz exigências práticas, ainda que não formalizadas.
