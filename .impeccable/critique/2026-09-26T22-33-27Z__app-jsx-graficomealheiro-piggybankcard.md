---
target: Stats -> Grupo -> Mealheiro (GraficoMealheiro + PiggyBankCard)
total_score: 16
max_score: 32
na_heuristics: 3,5
p0_count: 1
p1_count: 2
target_identity: "file:/home/user/hoje-ha-jogo/src/App.jsx#GraficoMealheiro,PiggyBankCard"
timestamp: 2026-09-26T22-33-27Z
slug: app-jsx-graficomealheiro-piggybankcard
---
**Method: dual-agent (A: a8229e9a62573a546 · B: af553f6c9fcf92795)**

## Design Health Score

| # | Heurística | Nota | Problema-chave |
|---|---|---|---|
| 1 | Visibilidade do estado do sistema | 2 | Positivo/negativo só muda a cor do texto, o fundo do cartão não reage |
| 2 | Correspondência com o mundo real | 2 | Vocabulário certo; linguagem visual (turquesa) não corresponde ao resto da app |
| 3 | Controlo e liberdade | n/a | Componente é de leitura, sem controlos próprios |
| 4 | Consistência e padrões | 1 | Viola a regra explícita do próprio DESIGN.md |
| 5 | Prevenção de erros | n/a | Não há input do utilizador aqui |
| 6 | Reconhecimento vs. memorização | 2 | Nada liga visualmente o fim do gráfico ao "SALDO ATUAL" |
| 7 | Flexibilidade e eficiência | 2 | Sem atalhos, mas também não claramente necessários |
| 8 | Estética e minimalismo | 2 | Gráfico completo (eixos+tooltip) para 2-4 pontos é chroma a mais |
| 9 | Ajuda a recuperar de erros | 3 | Estado "menos de 2 jogos" tratado com mensagem clara |
| 10 | Ajuda e documentação | 2 | A explicação da fórmula vem depois dos números, não antes |
| **Total** | | **16/32** | **Aceitável** (50%) |

## Veredito de especificidade

Não passa no teste. O "SALDO ATUAL" a 42px em Bebas Neue segue corretamente o componente "Marcador" — mas está dentro de um cartão turquesa (#0891b2 -> #0e7490) com cinzentos Tailwind soltos (#6b7280, #fca5a5, #86efac...) que não existem em lado nenhum do DESIGN.md. O achado mais forte: o próprio DESIGN.md já resolveu isto — diz textualmente "Verde confirmado (#4ade80): estado positivo — presença confirmada, pagamento feito, saldo do mealheiro." O código ignora a própria especificação escrita. Mais abaixo na mesma secção, TreasurerBalances e a lista de despesas usam corretamente dourado/verde/vermelho/superfície — prova que o padrão existe e funciona, só não foi aplicado aqui.

Scan determinístico: limpo para este ecrã — os 2 componentes analisados (GraficoMealheiro, PiggyBankCard) não geraram achados. O detector encontrou 3 avisos menores (transition: width, risco de layout jank) noutros pontos da app (linhas 1340, 1868, 2389 — dots de onboarding e barras de progresso), sem relação com o mealheiro.

Visualização em browser: saltada — sem forma prática de chegar a este ecrã autenticado com dados reais sem configuração extensa.

## Impressão geral

O número principal está certo, mas a moldura à sua volta trai a identidade da app. Um admin que passou pelo resto de "Hoje Há Jogo" chega a este cartão e sente que saiu para outra app. A maior oportunidade não é redesenhar nada de novo: é aplicar a regra que já está escrita no DESIGN.md e que o resto do ecrã já demonstra saber cumprir.

## O que funciona bem

1. SALDO ATUAL em Bebas Neue segue corretamente o componente de assinatura "Marcador" — isolado, funciona.
2. TreasurerBalances e DESPESAS, na mesma secção, usam bem os tokens do sistema — mostra que não é falta de sistema, é aplicação inconsistente.
3. Caso extremo "menos de 2 jogos" tratado com mensagem clara em PT-PT, em vez de gráfico partido.

## Problemas prioritários

[P0] Cor do cartão contradiz uma regra explícita do DESIGN.md
Porque importa: não é opinião — a spec diz "saldo do mealheiro = verde", o código usa turquesa. É a causa direta de o ecrã parecer de outra app.
Correção: trocar gradiente e stroke do gráfico por #4ade80/#1ea851; fundo do cartão para #14160f + borda, como já faz a variante showHero=false no mesmo ficheiro.
Comando sugerido: /impeccable colorize

[P1] O mesmo componente muda de paleta consoante quem o chama, criando duas linguagens visuais no mesmo scroll
Correção: unificar PiggyBankCard — se hero/compacto precisar de diferença, que seja de tamanho, não de cor.
Comando sugerido: /impeccable polish

[P1] Duas fontes de verdade para o mesmo saldo, sem reconciliação visível ao utilizador
Porque importa: o gráfico recalcula a partir de history; o "SALDO ATUAL" vem de piggybank calculado noutro lado. Numa funcionalidade cujo propósito é "tirar a desconfiança sobre dinheiro", uma eventual divergência entre os dois é o pior bug possível aqui.
Correção: derivar o último ponto do gráfico diretamente de piggybank, ou garantir por teste que convergem sempre.
Comando sugerido: /impeccable harden

[P2] Gráfico interativo completo (eixos+tooltip) para só 2-4 pontos
Correção: abaixo de ~5 pontos, trocar por lista compacta "jogo → saldo" ou sparkline sem eixos, libertando espaço para o número que importa.
Comando sugerido: /impeccable distill

[P3] Cinzentos Tailwind soltos em vez dos tokens texto-suave/texto-apagado
Correção: trocar por #8a9080/#565c4d.
Comando sugerido: /impeccable polish

## Red flags por persona

Casey (móvel, distraído, uma mão): o cartão turquesa não se parece com nada que já viu no resto da app — num relance de 2 segundos pode nem registar que é o saldo do grupo. Se algum dia o gráfico e o "SALDO ATUAL" não baterem certo, a leitura de Casey é "esta app não sabe quanto dinheiro há" — o oposto do que o mealheiro promete resolver.

Jordan (novo, a aprender o código de cores): este ecrã introduz um sexto significado (turquesa) que não existe em mais lado nenhum da app. Vê 4 números antes de qualquer explicação da fórmula — devia vir primeiro.

## Observações menores

- #fecaca, #fca5a5, #86efac são valores literais Tailwind, sinal de código copiado de outro sítio
- Sem alternativa acessível ao conteúdo do gráfico SVG para leitor de ecrã
- Math.round(saldo*100)/100 no gráfico, mas casas decimais inconsistentes com o resto da app
