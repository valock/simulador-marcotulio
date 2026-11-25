# Simulador MCMV — Marco Túlio

Simulador de financiamento imobiliário (Caixa / Minha Casa Minha Vida) para Uberlândia/MG. Quem abre o link **já cai direto na simulação**: em 4 perguntas rápidas descobre o valor do financiamento, o subsídio da Caixa e a parcela. O botão final do resultado cai direto no WhatsApp do Marco Túlio.

🔗 **Ao vivo:** https://simulador.marcotulio.pro

## Como funciona

- **Entrou, simulou.** A primeira tela já pergunta a renda. São 4 perguntas até o resultado (Renda, Idade, FGTS, Família), sem cadastro. Os campos seguem o desenho do cadastro eHABITA da Prefeitura, com as cores da marca.
- **Cheque Moradia.** Para renda familiar de até R$ 5.000, o passo do FGTS pergunta se a pessoa tem direito ao Cheque Moradia de Uberlândia. Marcando, abre o valor (R$ 10.000 até R$ 3.199,99; R$ 9.900 de R$ 3.200 a R$ 5.000) e as regras: renda até R$ 5.000, nunca ter tido imóvel no nome e título de eleitor de Uberlândia, sem tempo mínimo.
- **Resultado dividido.** Além do valor financiado (marcado como hipótese), a tela divide a compra como o simulador da Caixa: financiamento, subsídio, Cheque Moradia e entrada, com cota máxima de 80%. O valor do imóvel é editável e recalcula tudo na hora.
- **O resultado leva à aprovação.** Três botões de WhatsApp (topo, final e barra fixa) abrem a conversa com o Marco com uma mensagem pronta: o cliente pedindo a lista de documentos para abrir a análise de crédito, com o Cheque Moradia e o imóvel em vista quando houver.
- **O WhatsApp é sempre o do Marco.** O antigo link de parceiro (`?w=telefone&n=nome`) foi desativado. Links antigos continuam abrindo a página, mas o contato vem para o Marco.
- **Nova simulação.** Botão pequeno (⚡) no cabeçalho, nos passos de pergunta, para recomeçar do zero.
- **Indicar para um amigo.** Botão de compartilhamento (Web Share API, com fallback para WhatsApp) na abertura e no resultado. Base para uma futura **campanha de sorteio** (já há um teaser "indique e concorra a prêmios").

## Preview no WhatsApp / redes (Open Graph)
O `index.html` aponta para `https://simulador.marcotulio.pro/ogimage.png`. Para a foto aparecer ao compartilhar o link, o arquivo **`ogimage.png`** (1200×630) precisa estar na **raiz** do repositório, junto do `index.html`, para ser incluído no deploy automático do Netlify (evitando que uploads manuais sejam sobrescritos).

## Stack
Site estático — HTML/CSS/JS em arquivo único (`index.html`) + `ogimage.png` (preview social). Sem build, sem dependências.

## Deploy
Publicado no **Netlify**. Deploy automático ao dar push neste repositório (ou arraste a pasta no painel do Netlify para deploy manual).
