# Simulador MCMV — Marco Túlio

Simulador de financiamento imobiliário (Caixa / Minha Casa Minha Vida) para Uberlândia/MG. Quem abre o link **já cai direto na simulação**: em 4 perguntas rápidas descobre o valor do financiamento, o subsídio da Caixa e a parcela. O botão final do resultado cai direto no WhatsApp do Marco Túlio.

🔗 **Ao vivo:** https://simulador.marcotulio.pro

## Como funciona

- **Entrou, simulou.** Não há mais etapa de cadastro de corretor — a ferramenta é do Marco e o WhatsApp final é sempre o dele.
- **Simulação rápida.** Botão flutuante no canto inferior direito (⚡) inicia uma simulação pulando o nome — atalho para uso pessoal/atendimento na hora.
- **Indicar para um amigo.** Botão de compartilhamento (Web Share API, com fallback para WhatsApp) na abertura e no resultado. Base para uma futura **campanha de sorteio** (já há um teaser "indique e concorra a prêmios").
- **Compatibilidade.** Links antigos de parceiro (`?w=telefone&n=nome`) continuam funcionando e direcionam o contato para aquele número.

## Stack
Site estático — HTML/CSS/JS em arquivo único (`index.html`). Sem build, sem dependências.

## Deploy
Publicado no **Netlify**. Deploy automático ao dar push neste repositório (ou arraste a pasta no painel do Netlify para deploy manual).
