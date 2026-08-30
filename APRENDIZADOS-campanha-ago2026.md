# Aprendizados — primeira campanha Google Ads

**Período:** 19 a 28 de agosto de 2026 (10 dias)
**Campanha:** Claude Guided Test 1 · Rede de Pesquisa · Uberlândia/MG

---

## Números finais

| Métrica | Valor |
|---|---|
| Impressões | 833 |
| Cliques | 54 |
| CTR | **6,5%** (média do setor: 3–5%) |
| CPC médio | R$ 2,16 |
| Investimento | **R$ 116,71** |
| Conversões (contato no WhatsApp) | **1** |
| Taxa de conversão | **1,85%** |
| CPA | R$ 116,71 |

**Semana 1** (19–24/08): R$ 72,31 · 33 cliques · 1 conversão
**Semana 2** (22–28/08): R$ 74,01 · 37 cliques · **0 conversões**

A semana 2 gastou mais e converteu menos, mesmo com as negativas aplicadas.

---

## Lição 1 — O anúncio funciona. A conversão não.

CTR de 6,5% está **acima da média do setor**. As pessoas veem o anúncio e clicam.

Mas 54 cliques geraram 1 contato. Para um simulador gratuito e sem cadastro, uma
taxa saudável ficaria entre 5% e 10%. **1,85% é baixo.**

> **O gargalo não é atrair. É converter.**

Gastar mais em anúncio sem resolver isso multiplica o custo, não o resultado.

---

## Lição 2 — Compramos tráfego informacional esperando resposta transacional

A palavra `"minha casa minha vida"` consumiu **74% do orçamento** (R$55 de R$74 na
semana 2). Olhando o que ela realmente trouxe:

```
faixa 1 minha casa minha vida
requisitos para minha casa minha vida
lista de contemplados
o que é o minha casa minha vida
programa minha casa minha vida
quem pode se inscrever
```

Isso é gente **estudando o programa**, não comprando imóvel. Intenção informacional
raramente vira lead no primeiro clique — a pessoa quer entender, não decidir.

> **Anúncio cobra por clique. Curiosidade clica igual a intenção de compra.**

---

## Lição 3 — Os termos que convertem existem, mas não têm volume aqui

Os melhores CTRs foram justamente os transacionais:

| Termo | CTR |
|---|---|
| `"simulador de financiamento"` | **10,53%** |
| `"subsidio minha casa minha vida"` | **25,00%** |
| `"minha casa minha vida"` (informacional) | 6,41% |

Mas juntos somaram só **61 impressões na semana**. E as variações long-tail que
adicionamos (`"como saber meu subsidio"`, `"valor do subsidio..."`) tiveram **0 a 2
impressões** — sem volume.

> **Uberlândia não tem massa crítica de busca transacional para sustentar mídia
> paga nesse tema.** O volume está na dúvida, não na decisão.

---

## Lição 4 — Orçamento diário não é teto

Configuramos R$10/dia. O que aconteceu:

```
19/08 → R$ 19,96
27/08 → R$ 20,76
```

O Google pode gastar **até 2× o orçamento diário** em um dia, compensando em dias
mais fracos ao longo do mês. É regra da plataforma, não erro.

> **Por isso o gasto passou do previsto.** Para controle real, use o orçamento
> mensal da conta ou data de término curta.

---

## Lição 5 — Retrato de quem procura (o dado mais valioso)

| Dimensão | Resultado |
|---|---|
| **Dispositivo** | **90% smartphone** (528 de 589 impressões, 94% do gasto) |
| **Gênero** | **63,5% mulheres** · 36,5% homens |
| **Idade** | 25–34: 31,9% · 35–44: 26,3% → **58% entre 25 e 44** |
| **Horário de pico** | **11h às 16h** (topo às 14h) |
| **Dias fortes** | Terça-feira e sábado |

Três consequências práticas:

1. **Mobile não é detalhe, é o produto.** Qualquer fricção no celular custa o lead.
2. **A comunicação deveria falar com mulheres de 25 a 44** — hoje é neutra.
3. **O pico é meio do dia, não à noite.** A intuição de anunciar de noite estava errada.

---

## Lição 6 — Ignore a "pontuação de otimização" do Google

As recomendações recebidas incluíam:

- ❌ *"Amplie seu alcance com a Rede de Display"*
- ❌ *"Autorize a rede de parceiros de pesquisa"*
- ❌ *"Definir lances mais eficientes com Maximizar conversões"*

As três queimariam o orçamento: Display entrega cliques acidentais, parceiros
trazem tráfego de baixa qualidade, e Maximizar conversões sem histórico gasta caro
explorando.

> **Pontuação de otimização mede o alinhamento com os interesses do Google, não com
> os seus.** Recomendação útil daquela lista: só sitelinks e frases de destaque.

---

## A conclusão estratégica

A demanda real de Uberlândia sobre Minha Casa Minha Vida é **majoritariamente
informacional**. Isso é:

- ❌ **Ruim para mídia paga** — você paga R$2 por curiosidade que não fecha
- ✅ **Excelente para SEO** — você responde uma vez e captura para sempre, de graça

> **O canal certo para essa demanda é conteúdo, não anúncio.**

A campanha não foi desperdício: ela **mapeou a demanda real do mercado** por R$117
e provou que a medição funciona ponta a ponta. Esse mapa virou o
`BRIEF-conteudo-dados-ads.md` — 118 termos reais agrupados por intenção, com as
lacunas identificadas (faixas: 35 impressões e zero cliques; subsídio: CTR de 33%).

**Anúncio pago deve voltar depois**, e menor: só nos termos transacionais, quando
houver conteúdo forte segurando o resto.

---

## O que ainda falta apurar — e é grátis

A pergunta mais importante segue sem resposta: **onde os 54 cliques morreram?**

O simulador já mede isso. No GA4, propriedade `marcotulio.pro`:

**Relatórios → Engajamento → Eventos**, período 19–28/08. Compare:

| Evento | O que significa |
|---|---|
| `page_view` | chegaram na página |
| `simulacao_iniciada` | clicaram em "Começar simulação" |
| `simulacao_passo` | avançaram nas perguntas |
| `simulacao_concluida` | viram o resultado |
| `whatsapp_click` | pediram contato |

**Como interpretar:**

- **Muitos `page_view`, poucos `simulacao_iniciada`** → a primeira tela não convence.
  Solução: hero mais direto, menos texto antes do campo.
- **Iniciaram mas poucos `simulacao_concluida`** → as 4 perguntas cansam.
  Solução: reduzir passos ou mostrar resultado parcial antes do fim.
- **Concluíram mas não clicaram no WhatsApp** → o resultado não gera ação.
  Solução: CTA mais forte, ou captura de contato na própria página.

Esse número decide o próximo investimento. Sem ele, qualquer mudança é chute.

---

## Plano recomendado

**1. Pausar a campanha.** O orçamento estourou e a taxa de conversão não justifica
continuar. Pausar não apaga nada — os dados e conversões ficam.

**2. Extrair o funil no GA4** (10 minutos, custo zero). É o dado que falta.

**3. Investir o esforço em SEO** com o brief já pronto. As lacunas de "faixas" e
"subsídio" têm demanda comprovada e nenhum concorrente respondendo bem.

**4. Corrigir o gargalo de conversão** conforme o funil apontar.

**5. Voltar ao pago depois**, com campanha cirúrgica: só `simulador`, `subsídio` e
`quanto posso financiar`, orçamento mensal fechado e a página já corrigida.

---

## O que foi construído e continua valendo

Independente do resultado da campanha, ficou de pé:

✅ Simulador com 7.295 caracteres indexáveis (era zero)
✅ `/privacidade`, CRECI e conformidade para anunciar
✅ Medição em duas propriedades GA4, conversões importadas no Ads
✅ Atribuição de campanha na mensagem do WhatsApp (`_ref:`)
✅ Mapa de 118 termos de busca reais do mercado de Uberlândia
✅ Retrato demográfico do público: mobile, feminino, 25–44, meio do dia

R$117 por esse conjunto de informações é barato. O erro seria repetir a campanha
sem usar nada disso.

---

*Análise gerada a partir dos relatórios oficiais do Google Ads exportados em
29/08/2026: série temporal, palavras-chave, termos de pesquisa, dispositivos,
demografia, dia e hora, conteúdo excluído e recomendações.*
