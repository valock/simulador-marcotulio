# Simulador MCMV — Marco Túlio

Simulador de financiamento imobiliário (Caixa / Minha Casa Minha Vida) para Uberlândia/MG. Quem abre o link **já cai direto na simulação**: em 4 perguntas rápidas descobre o valor do financiamento, o subsídio da Caixa e a parcela. O botão final do resultado cai direto no WhatsApp do Marco Túlio.

🔗 **Ao vivo:** https://simulador.marcotulio.pro

## Como funciona

- **Entrou, simulou.** A primeira tela já pergunta a renda. São 4 perguntas até o resultado, sem cadastro.
- **O resultado leva à aprovação.** A tela mostra o valor da tabela Caixa e explica que o valor aprovado de verdade sai na análise de crédito. O botão abre o WhatsApp do Marco com uma mensagem pronta, do cliente pedindo a lista de documentos para abrir a análise.
- **O WhatsApp é sempre o do Marco.** O antigo link de parceiro (`?w=telefone&n=nome`) foi desativado: ele deixava qualquer pessoa apontar o botão para outro número. Links antigos continuam abrindo a página, mas o contato vem para o Marco.
- **Nova simulação.** Botão flutuante (⚡) no canto inferior direito para recomeçar do zero.
- **Indicar para um amigo.** Botão de compartilhamento (Web Share API, com fallback para WhatsApp) na abertura e no resultado. Base para uma futura **campanha de sorteio** (já há um teaser "indique e concorra a prêmios").

## Preview no WhatsApp / redes (Open Graph)
O `index.html` aponta para `https://simulador.marcotulio.pro/ogimage.png`. Para a foto aparecer ao compartilhar o link, o arquivo **`ogimage.png`** (1200×630) precisa estar na **raiz** do repositório, junto do `index.html`, para ser incluído no deploy automático do Netlify (evitando que uploads manuais sejam sobrescritos).

## Stack
Site estático — HTML/CSS/JS em arquivo único (`index.html`) + `ogimage.png` (preview social). Sem build, sem dependências.

## Deploy
Publicado no **Netlify**. Deploy automático ao dar push neste repositório (ou arraste a pasta no painel do Netlify para deploy manual).
