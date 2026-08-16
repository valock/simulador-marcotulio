# Brief para a sessão do repositório `marcotulio.pro`

> Cole este documento inteiro como primeira mensagem na sessão que tiver acesso ao
> repositório do site `marcotulio.pro`. Ele traz a auditoria já feita do lado do
> simulador, o inventário verificado do site e as prioridades.

---

## Contexto

Somos dois projetos do mesmo ecossistema:

| Projeto | Papel | Situação |
|---|---|---|
| `simulador.marcotulio.pro` | Aplicação de conversão (simulador MCMV) | Já otimizado — ver abaixo |
| `marcotulio.pro` | **Hub de conteúdo e autoridade** | É o seu escopo |

**Decisão de arquitetura já tomada:** o hub de SEO é o `marcotulio.pro`. O simulador
continua no subdomínio como ferramenta de conversão. Não migrar. Motivo: o domínio
principal já é SSG, já tem autoridade e já tem 70 artigos; migrar traz risco alto e
ganho baixo.

### O que já foi feito no simulador (não refazer)

Auditoria encontrou o simulador servindo **zero conteúdo indexável** (todo o HTML era
injetado por JavaScript). Corrigido:

- Camada editorial estática: **7.120 caracteres** indexáveis, 1 H1, 10 H2, 5 H3.
- H1: `Simulador Minha Casa Minha Vida em Uberlândia`
- `<title>`: `Simulador Minha Casa Minha Vida Uberlândia | Caixa`
- `robots.txt`, `sitemap.xml` e `404.html` criados (antes davam 404).
- JSON-LD: `WebApplication`, `FAQPage` (com perguntas visíveis), `BreadcrumbList`.
- **26 links** do simulador para artigos do `marcotulio.pro` (todos verificados 200).
- Analytics: eventos `simulacao_iniciada`, `simulacao_passo`, `simulacao_concluida`,
  `whatsapp_click`, `conteudo_link_click`. Renda vai como **faixa anônima** (LGPD).
  GA4: `G-ZK0QTMRVWK`. `simulacao_concluida` e `whatsapp_click` já são conversões.

---

## ⚠️ REGRA CRÍTICA: não canibalizar o simulador

**Não criar página de simulador no `marcotulio.pro`.** Hoje `/simulador`,
`/simular` e `/simulador-financiamento` dão 404 — e devem continuar assim.
Qualquer intenção de "simular" deve **linkar para `https://simulador.marcotulio.pro/`**.

⚠️ **Verificar canibalização existente:** o artigo `/blog/financiamento-caixa-uberlandia`
disputa termo de dinheiro com o simulador. Auditar intenção: se for informacional,
manter e linkar para o simulador; se for de ferramenta, ajustar para não competir.

---

## Auditoria do lado de fora (já verificada)

- Stack: SSG, ~9.459 caracteres de texto sem JS na home. Bem construído.
- JSON-LD na home: `RealEstateAgent`, `Organization`, `City`, `State`, `PostalAddress`.
- `robots.txt` OK, `sitemap.xml` OK (81 URLs, sem sub-sitemaps).
- H1 da home: `Corretor de imóveis em Uberlândia: realize o sonho da casa própria`.
- A home linka **7×** para o simulador. **O inverso já foi resolvido.**

### O que fazer primeiro (auditoria interna que só você consegue)

1. Framework, gerador do blog, onde ficam os artigos (Markdown? CMS?), deploy.
2. Como `<title>`, meta, canonical e JSON-LD são gerados por página.
3. Se os artigos têm `Article`/`BreadcrumbList` schema e data de atualização.
4. Core Web Vitals atuais (LCP/INP/CLS) — medir antes de mexer.
5. Quais artigos já têm tráfego/backlinks (Search Console) — **esses não se mexe
   sem 301**.

---

## Inventário verificado — 81 URLs

### Páginas (11)
`/` · `/blog` · `/noticias` · `/sobre` · `/torrano` · `/indique` · `/plantao`
`/tambore-miranda` · `/ficha-tambore` · `/uberlandia-tech` · `/tech/observatorio-ia-uberlandia`

### Artigos por cluster (70)

**Financiamento / regras** (base de autoridade, alta prioridade de malha)
```
financiamento-caixa-uberlandia            ← auditar canibalização
quanto-preciso-ganhar-financiar-uberlandia
quanto-de-entrada-financiamento-uberlandia
como-usar-fgts-comprar-imovel-uberlandia
financiar-imovel-autonomo-uberlandia
teto-minha-casa-minha-vida-uberlandia
minha-casa-minha-vida-2026-novas-regras
mcmv-juros-menores-renda-21-mil
documentos-minha-casa-minha-vida-2026
minha-casa-minha-vida-nome-sujo-score
cheque-moradia-uberlandia-minha-casa-minha-vida
casinha-da-prefeitura-uberlandia
registro-de-incorporacao-comprar-na-planta
alugar-ou-financiar-uberlandia
primeiro-imovel-2026
dia-da-assinatura-caixa-contrato-magico
aprovado-e-travado · nao-e-pra-voce · carro-ou-casa-primeiro
```

**Tipologia (casa × apartamento)** — grande oportunidade semântica
```
casa-no-terreno-uberlandia
casas-pacaembu-uberlandia
622-casas-minha-casa-minha-vida-uberlandia
comprar-apartamento-minha-casa-minha-vida-uberlandia
```

**Construtoras**
```
Pacaembu : casas-pacaembu-uberlandia · moradas-do-horizonte-sabara-uberlandia
           uberlandia-saf-pacaembu-mercado-imobiliario
VIC      : gran-vic-uberlandia
Rummo    : bris-residence-morumbi-uberlandia
MRV      : apartamento-mrv-uberlandia · reserva-costa-do-sol-mrv-uberlandia
           soul-mrv-gavea-sul-uberlandia
Union    : union-landscape-shopping-park-uberlandia · union-vereda-tubalina-uberlandia
           union-vista-grand-ville-uberlandia
Opção    : lancamento-opcao-uberlandia · opcao-studios-living-francisco-galassi-uberlandia
           opcao-studios-campus-umuarama-uberlandia · opcao-studios-business-umuarama-uberlandia
HLTS     : nenhum artigo identificado — lacuna
```

**Bairros / regiões**
```
Shopping Park : shopping-park-minha-casa-minha-vida-uberlandia
                union-landscape-shopping-park-uberlandia
Morumbi       : apartamento-morumbi-uberlandia · morumbi-uberlandia-mcmv
                bris-residence-morumbi-uberlandia · solis-residence-morumbi-uberlandia
                trez-residence-morumbi-uberlandia
Marileusa     : apartamentos-no-granja-marileusa-uberlandia · prime-clube-marileusa-uberlandia
Tubalina      : union-vereda-tubalina-uberlandia
Mansour       : mor-jardim-mansour-uberlandia
Zonas         : apartamentos-zona-sul/leste/oeste/norte-uberlandia
Outros        : jardim-holanda · jardim-sul-uberlandia-zona-sul · vila-osvaldo
                vila-vert-alvorada · park-jardim-do-sol-novo-mundo
                horizon-residencial-fruta-do-conde · matiz-residence
                gran-toro-x-bella-vita-jardim-espanha · loft-pequis
                enderecos-empreendimentos-uberlandia
```

**Mercado / institucional**
```
fipezap-julho-2026-precos-imoveis · intencao-compra-recorde-imoveis-usados-2026
reforma-casa-brasil-aporte-750-milhoes · uberlandia-serie-c-acesso-2026
feirao-torrano-junho-2026-uberlandia · feirao-torrano-prefeitura-habita-mais-uberlandia
renault-zurique-uberlandia · copa-2026-comprar-imovel-uberlandia
assistir-copa-2026-casa-propria · trabalha-em-araguari-sair-do-aluguel
apartamento-araguari-perguntas-e-respostas
```

**Diagnóstico:** os clusters **já existem como artigos soltos**. O que falta não é
conteúdo novo — é **estrutura de hub e malha de links**.

---

## Prioridades

### P0 — Estrutura e malha (maior retorno, menor risco)

**1. Malha de links interna.** É o item de maior impacto. Hoje os artigos são silos.
   - Todo artigo de financiamento/renda/FGTS/entrada → link contextual para
     `https://simulador.marcotulio.pro/` com âncora descritiva variada
     (`simule seu financiamento Minha Casa Minha Vida`,
     `veja quanto você consegue financiar em Uberlândia`,
     `calcule sua parcela pela Caixa`). **Nunca "clique aqui".**
   - Artigos de empreendimento → artigo do bairro + artigo da construtora + simulador.
   - Artigos de bairro → empreendimentos daquele bairro.
   - Nenhum artigo deve terminar em rua sem saída.

**2. Páginas-pilar que não existem** (agregam artigos que já existem):
   ```
   /minha-casa-minha-vida-uberlandia/        ← hub principal do programa
   /construtoras/                             ← índice
   /construtoras/pacaembu-uberlandia/
   /construtoras/vic-engenharia-uberlandia/
   /construtoras/rummo-uberlandia/
   /construtoras/hlts-uberlandia/             ← só se houver dado verificado
   /bairros/                                  ← índice
   /bairros/shopping-park/
   /bairros/morumbi/
   /bairros/tubalina/
   /bairros/ecopark/
   /bairros/granja-marileusa/
   ```
   Cada pilar: H1 próprio, resumo, contexto local, lista dos artigos/empreendimentos
   já publicados, FAQ, link para o simulador, CTA, **data de última atualização** e
   **fontes consultadas**.

**3. Schema por template:** `Article` + `BreadcrumbList` nos artigos, `WebPage` +
   `BreadcrumbList` nos pilares, `ItemList` nas listagens reais, `Person`/
   `RealEstateAgent` em `/sobre`. `FAQPage` **só** onde a FAQ estiver visível.

**4. Página "Qual imóvel cabe na minha renda?"** — captura a intenção mais valiosa
   e entrega no simulador.

**5. Casa × apartamento** — cluster comparativo, aproveitando `casa-no-terreno`,
   `casas-pacaembu`, `622-casas`, `comprar-apartamento-mcmv`.

### P1
Radar Imobiliário (`/mercado-imobiliario-uberlandia/`) · páginas de comparação ·
busca interna · mapa · sitemap segmentado (páginas/artigos/construtoras/bairros) ·
alerta de conteúdo desatualizado.

### P2
Banco de imóveis estruturado (`Builder`/`Project` com `verifiedAt`), match imóvel ×
simulação, painel admin. **Depende de dados de inventário verificados que o Marco
precisa fornecer** — não inventar.

---

## Guardrails inegociáveis

- ❌ Não copiar texto de site de construtora. Usar como fonte de fato, escrever original.
- ❌ Não publicar preço, unidade disponível, prazo ou característica sem fonte verificável.
- ❌ Não afirmar "melhor", "maior", "líder", "nº 1" sobre nenhuma empresa.
- ❌ Não criar doorway pages (trocar só o número da renda / nome do bairro).
- ❌ Não criar página sem conteúdo original suficiente.
- ❌ Não deixar filtro (`?renda=&bairro=`) virar página indexável — controlar faceted
  navigation com canonical/noindex.
- ✅ Toda página que cita regra ou número: fonte + data de verificação visível.
- ✅ Qualquer URL alterada → **301**, com mapa `OLD → NEW`. Nunca perder URL com tráfego.
- ✅ Deixar claro que é conteúdo independente de Marco Túlio — não é site oficial da
  Caixa nem de construtora.
- ✅ Não regredir Core Web Vitals. Medir antes e depois.

---

## Entregar ao final

Estado encontrado · arquivos alterados · mapa da arquitetura SEO ·
keyword → URL · mapa de links internos · schemas · performance antes/depois ·
robots/sitemap/canonical/redirects · eventos de analytics · páginas criadas ·
pendências · **lista de URLs para pedir indexação no Search Console**.

Comece pela auditoria interna do repositório e só depois implemente, em etapas
reversíveis.
