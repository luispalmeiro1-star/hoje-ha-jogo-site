# Ideias vindas da concorrência

Registo do que vale a pena aproveitar de apps concorrentes. **Ideias e
funcionalidades, não textos nem desenhos** — copiar copy ou layout de outra
marca não se faz, e além disso a nossa voz é o que nos distingue.

---

## Footinho — email de novidades, 25/09/2026

App francesa de organização de jogos de futebol entre amigos, com 15 anos.
Nativa (App Store e Play Store). Diz-se "100% gratuita e sem publicidade", que é
a mesma promessa que nós fazemos.

O Luís recebeu um email intitulado *"Mercado fechado: 4 reforços chegam ao
Footinho"* — notas de versão vestidas de mercado de transferências.

### O que mais interessa: o canal, não as funcionalidades

**Eles têm uma lista de email e nós não.** O email não serve para angariar
ninguém novo — serve para quem já usa voltar a abrir a app e sentir que o
produto está vivo. Nós lançámos o botão "não vou", o voto secreto no MVP, o
lembrete da manhã do jogo e o grupo de demonstração sem que um único utilizador
soubesse.

Perguntas por responder antes de fazer seja o que for:
- Guardamos o email das pessoas quando criam conta? (verificar em `players`)
- Se não guardamos, faz sentido passar a guardar, e com que consentimento?
- Alternativa sem email nenhum: um ecrã de "Novidades" dentro da app, com um
  ponto vermelho no separador Perfil quando há coisas por ler. Não precisa de
  consentimento, não precisa de servidor de email, e chega a quem já lá está.

### Funcionalidades que mostraram

| Ideia | O que é | Vale a pena? |
|---|---|---|
| **Cor e nome por equipa** | Cada equipa tem nome ("Os Nulos") e cor própria, e os jogadores aparecem com a cor da sua equipa | **Sim.** Barato e resolve uma confusão real no balneário: quem é dos coletes e quem não é. Encaixa no que já temos em Equipas. |
| **3, 4 equipas ou mais** | Em vez de duas equipas fixas: torneio, rotação, o vencedor fica | **Talvez.** Muda a lógica das equipas toda. Só depois de alguém pedir. |
| **Apagar mensagens do chat** | O admin apaga uma mensagem em segundos | **Sim, e é mais urgente do que parece.** O exemplo que eles usam é alguém a enviar "Camisolas a -80% no meu site!!!". No dia em que entrar spam num grupo nosso, o admin não tem nada para fazer. |
| **Marcar-se como lesionado** | Estado no perfil, enquanto a pessoa recupera | **Sim.** Barato, e evita que quem está lesionado leve avisos semanais a perguntar se vai jogar. Liga-se bem aos nossos lembretes. |
| **Seleção favorita** | Bandeira do país no perfil | **Não.** Faz sentido numa app com utilizadores de vários países; o nosso público é português. |

### Duas coisas que eles fazem e nós devíamos copiar no espírito

1. **"Respondam a este email se precisarem de alguma funcionalidade,
   respondemos a todos os pedidos."** Um pedido directo de feedback, com
   promessa de resposta. Nós temos o botão "Reportar problema" — que é para
   quando alguma coisa **está partida**. Falta o caminho para "gostava que
   fizesse X". São coisas diferentes e as pessoas não usam um para o outro.

2. **Pedir avaliações.** Eles pedem na App Store, Play Store e Trustpilot. As
   duas primeiras não se aplicam a nós — somos uma PWA e não estamos em loja
   nenhuma. **O Trustpilot aplica-se**, e é prova social que hoje não temos
   nenhuma. Ligar isto ao `PRODUCT.md`: está lá escrito que não temos
   testemunhos e que não se podem inventar. Isto é a forma honesta de passar a
   ter.

### O que isto diz sobre nós

- Eles são nativos, nós somos PWA. Isso dá-nos "não é preciso instalar" e
  tira-nos as lojas — e com elas, avaliações, ranking e descoberta orgânica.
  É um dos custos da escolha, e vale a pena tê-lo consciente.
- Quinze anos de vantagem. Não se compete com isso em funcionalidades; compete-se
  por ser de cá — MBWay, euros, português de Portugal.

---

## Prioridade sugerida, quando houver créditos

1. **Ecrã de novidades dentro da app** (ou email, se guardarmos emails). É o que
   falta mesmo: ninguém sabe o que temos feito.
2. **Apagar mensagens do chat.** Pequeno, e a primeira vez que houver spam já é
   tarde.
3. **Cor e nome por equipa.** Pequeno e nota-se logo.
4. **Estado "lesionado".** Pequeno, e melhora os lembretes.
5. Pedir feedback de funcionalidades, separado do reportar problemas.
6. Trustpilot — só quando houver utilizadores suficientes para valer a pena.
