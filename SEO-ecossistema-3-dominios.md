# Relatório SEO — ecossistema Marco Túlio

**Data:** 30 de agosto de 2026
**Propriedades auditadas:** `marcotulio.pro` · `imoveis.marcotulio.pro` · `simulador.marcotulio.pro`

---

## 1. Correção importante: a campanha converteu melhor do que eu concluí

Com **2 leads** confirmados (e não 1):

| Métrica | Cálculo anterior | **Real** |
|---|---|---|
| Leads | 1 | **2** |
| CPA | R$ 116,71 | **R$ 58,35** |
| Taxa de conversão | 1,85% | **3,70%** |

**R$58 por lead qualificado** — pessoa que já simulou, sabe quanto financia e
procurou você — é um bom número para financiamento imobiliário. Uma única venda
paga dezenas de leads a esse custo.

> **Retiro a recomendação de pausar.** Com esse CPA, a decisão de continuar é de
> caixa (quanto você pode investir por mês), não de eficiência.

### ⚠️ Mas existe uma falha de medição

O Google Ads registrou **1 conversão**, você recebeu **2 leads**. Metade não foi
contabilizada.

Isso é sério porque o Ads otimiza com base no que enxerga — dados incompletos
levam a decisões erradas. Causas prováveis:

- A pessoa clicou no WhatsApp de um jeito que não disparou o evento
- Bloqueador de anúncios no navegador dela
- Voltou depois, em outra sessão, fora da janela de atribuição
- Chegou pelo botão flutuante ou por outro caminho

**Como verificar:** GA4 → propriedade `marcotulio.pro` → Relatórios → Engajamento
→ Eventos, período 19–28/08. Se `whatsapp_click` mostrar 2 e o Ads 1, é atribuição.
Se mostrar 1, o segundo lead veio por fora da campanha.

---

## 2. Auditoria técnica das três propriedades

| | marcotulio.pro | imoveis.marcotulio.pro | simulador.marcotulio.pro |
|---|---|---|---|
| **Papel** | Autoridade e conteúdo | Inventário | Ferramenta de conversão |
| **Renderização** | SSG ✅ | SSG ✅ | Estático ✅ |
| **Texto sem JS** | 9.459 | 20.016 | 7.295 |
| **URLs no sitemap** | 81 | **3** ⚠️ | 2 |
| **robots.txt** | ✅ | ✅ | ✅ |
| **canonical** | ✅ | ✅ | ✅ |
| **JSON-LD** | RealEstateAgent, Organization | RealEstateAgent, Organization, OfferCatalog, Offer, Service | WebApplication, FAQPage, Breadcrumb |
| **og:image** | ✅ | ✅ | ✅ |

**Veredito técnico: os três estão bem construídos.** Não há problema de base — nem
CSR, nem canonical quebrado, nem falta de schema. Isso é raro e é mérito seu.

### A página de imóvel está muito boa

`/imovel/apartamento-2-quartos-chacaras-tubalina-uberlandia/`

✅ Title com preço: *"Apartamento 43.43 m², 2 quartos em Chácaras Tubalina — R$ 185.000"*
✅ Schema `Offer` + `RealEstateAgent` + `BreadcrumbList`
✅ 20 de 21 imagens com alt
✅ 1.829 caracteres de texto próprio

Preço no título é decisão certa — aumenta CTR e filtra quem não tem perfil.

---

## 3. Os três problemas reais (nenhum é técnico)

### 🔴 P0 — O funil está quebrado no ponto mais valioso

```
marcotulio.pro  → imoveis:  4 links       → simulador:  7 links
imoveis         → marcotulio: 43 links    → simulador:  3 links
simulador       → marcotulio: 25 links    → imoveis:    0 links  ← AQUI
```

**O simulador não linka para o portal de imóveis.**

Pense na jornada: a pessoa descobre que pode financiar R$195.000 e recebe um subsídio
de R$2.244. Esse é o momento de maior intenção de compra de toda a jornada dela.
E a tela de resultado não mostra **nenhum imóvel**.

Ela sai da página com um número na cabeça e sem nada para olhar.

**Correção:** bloco na tela de resultado do simulador —
*"Imóveis em Uberlândia dentro do seu valor"* → `imoveis.marcotulio.pro`.
Isso é implementável no simulador e eu posso fazer.

---

### 🔴 P0 — O portal de imóveis tem 3 URLs

Toda a estrutura técnica está pronta — schema, canonical, sitemap, páginas rápidas —
e existem **2 imóveis** indexados.

Não há SEO possível sem inventário. Um portal com 2 anúncios não ranqueia para
"apartamento em Uberlândia" e não sustenta o funil que o simulador alimenta.

**O que falta criar (por ordem de retorno):**

**a) Páginas de listagem por bairro** — hoje inexistentes:
```
/apartamentos/tubalina/
/apartamentos/jardim-holanda/
/apartamentos/morumbi/
/apartamentos/shopping-park/
/casas/shopping-park/
```
Essas capturam "apartamento em Tubalina", "casa no Shopping Park" — buscas
transacionais com intenção clara.

**b) Páginas por faixa de preço** — casam com a saída do simulador:
```
/imoveis-ate-200-mil-uberlandia/
/imoveis-ate-300-mil-uberlandia/
/imoveis-minha-casa-minha-vida-uberlandia/
```
Alguém que simulou R$195 mil deve cair direto numa dessas.

**c) Mais imóveis.** Regra prática: uma listagem precisa de 5+ itens para não
parecer vazia ao usuário e ao Google.

⚠️ **Só publique página de listagem quando houver imóvel para listar.** Listagem
vazia é pior que ausência de página.

---

### 🟡 P1 — Entidade duplicada: dois sites dizem ser o mesmo corretor

`marcotulio.pro` e `imoveis.marcotulio.pro` **ambos** declaram
`RealEstateAgent` + `Organization` no JSON-LD.

Para o Google, isso são duas entidades concorrentes com o mesmo nome. Divide o
sinal em vez de somar — e é exatamente o que atrapalha aparecer no Knowledge Panel
e nos resultados locais.

**Correção:**

1. Eleger **`marcotulio.pro/sobre`** como a página canônica da entidade Marco Túlio
2. Manter o `RealEstateAgent` completo **só lá**
3. Nos outros dois domínios, referenciar em vez de repetir:

```json
{
  "@type": "RealEstateAgent",
  "@id": "https://marcotulio.pro/sobre#marcotulio",
  "name": "Marco Túlio Andrade Freitas",
  "url": "https://marcotulio.pro/sobre"
}
```

4. Usar `sameAs` ligando os três domínios e as redes sociais

Isso consolida os sinais num só lugar em vez de espalhá-los.

---

### 🟡 P1 — O blog não alimenta o portal de imóveis

`marcotulio.pro → imoveis` tem só **4 links**, com 70 artigos publicados.

Vários desses artigos são sobre bairros e empreendimentos específicos — e terminam
sem levar a lugar nenhum comercialmente:

| Artigo | Deveria linkar para |
|---|---|
| `apartamentos-zona-sul-uberlandia` | listagem Zona Sul |
| `union-vereda-tubalina-uberlandia` | imóveis em Tubalina |
| `jardim-holanda-uberlandia` | o apartamento do Jardim Holanda (já existe!) |
| `morumbi-uberlandia-mcmv` | listagem Morumbi |
| `shopping-park-minha-casa-minha-vida-uberlandia` | listagem Shopping Park |

O artigo do Jardim Holanda é o caso mais gritante: **você já tem um imóvel lá
publicado** e o artigo não aponta para ele.

---

## 4. Arquitetura: está certa, não mude

| Domínio | Intenção que captura | Exemplo de busca |
|---|---|---|
| `marcotulio.pro` | Informacional | "quanto preciso ganhar para financiar" |
| `imoveis.marcotulio.pro` | Transacional | "apartamento 2 quartos Tubalina" |
| `simulador.marcotulio.pro` | Ferramenta | "simulador minha casa minha vida" |

Os três títulos estão diferenciados e não competem entre si. **Não há canibalização
de título.** A separação por subdomínio foi uma boa decisão — cada um pode ranquear
para sua intenção sem atrapalhar o outro.

O que falta é fazer os três **conversarem**.

---

## 5. Plano de ação

### Simulador — posso implementar
- [ ] Bloco "Imóveis dentro do seu valor" na tela de resultado → `imoveis.marcotulio.pro`
- [ ] Passar a faixa de valor na URL (ex.: `?ate=200000`) para o portal filtrar
- [ ] Ajustar schema para referenciar a entidade canônica em vez de duplicar

### imoveis.marcotulio.pro — precisa de acesso ao repositório
- [ ] Páginas de listagem por bairro (só com 5+ imóveis cada)
- [ ] Páginas por faixa de preço, casando com a saída do simulador
- [ ] Trocar `RealEstateAgent` completo por referência `@id` ao canônico
- [ ] Publicar mais imóveis — é o gargalo real

### marcotulio.pro — precisa de acesso ao repositório
- [ ] Linkar os artigos de bairro para as listagens correspondentes
- [ ] Começar pelo Jardim Holanda, onde o imóvel já existe
- [ ] Criar os dois artigos P0 do brief anterior: **faixas** e **subsídio**
- [ ] Consolidar a entidade em `/sobre` com `sameAs` para os três domínios

### Google Ads
- [ ] Investigar a conversão não registrada (1 de 2)
- [ ] Manter a campanha: R$58/lead justifica
- [ ] Considerar orçamento mensal em vez de diário, para evitar o estouro de 2×

---

## 6. O que medir daqui a 30 dias

| Indicador | Hoje | Meta |
|---|---|---|
| URLs indexadas no portal de imóveis | 3 | 15+ |
| Links simulador → imóveis | 0 | presente no resultado |
| Links blog → imóveis | 4 | 20+ |
| CPA da campanha | R$ 58 | manter ou reduzir |
| Conversões registradas vs leads reais | 1 de 2 | 100% |

---

*Auditoria feita sobre o HTML servido em produção nos três domínios, sitemaps
públicos e relatórios oficiais do Google Ads de 19 a 28 de agosto de 2026.*
