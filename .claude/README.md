# .claude — ferramentas de produção (não fazem parte do site)

Skills do Claude Code para criar vídeos, animações e sons de divulgação do simulador.
Ficam em `.claude/skills/` e carregam sozinhas quando o Claude Code abre este repositório.
O site não usa nada daqui: o `_redirects` na raiz responde 404 para `/.claude/*` no Netlify.

| Skill | Para que serve | Origem |
|---|---|---|
| `huashu-motion` | Vídeos de lançamento/propaganda feitos em código, com trilha | alchaincyf/huashu-motion |
| `rossark-motion-skill` | Transforma SVG em animação de 60 fps (personagens, ícones) | rossark0/rossark-motion-skill |
| `take-one` | Vídeo de lançamento, anúncio ou clipe a partir de uma frase | talsiach/take-one |
| `reanimate` | Copia uma animação (site, vídeo, gif) quadro a quadro | NiazMorshed2007/reanimate |
| `argo-guide` | Demo do produto gravada com Playwright + narração | shreyaskarnik/argo |
| `explainroo` | Vídeos explicativos e demos com voz local gratuita | vincentsch/explainroo |
| `video-director` | Dirige, monta e verifica vídeos renderizados em HTML/Canvas | win4r/video-director |
| `earshot`, `real-sound` | Efeitos sonoros gerados em código | Leonxlnx/earshot |

## Dependências (instale só quando for usar)

Nada é instalado no site. Algumas skills pedem ferramentas na máquina onde o vídeo é gerado:

- **Node.js 20+, ffmpeg e Chrome/Chromium** — huashu-motion, take-one, argo, explainroo, video-director
- `take-one`: `bash .claude/skills/take-one/scripts/doctor.sh` diz o que falta
- `explainroo`: `npx --yes explainroo doctor --fetch` (baixa ~860 MB de voz na primeira vez)
- `argo`: `npm i -D @argo-video/cli` **em outra pasta**, não neste repositório
- `earshot`: `pip install "earshot @ git+https://github.com/Leonxlnx/earshot"` (Python 3.10+)
- `rossark-motion-skill`: a renderização de exemplo usa Swift (macOS); o método serve para web também

Gere os vídeos e sons **fora da raiz do site** (ex.: uma pasta `producao/` ignorada pelo git ou outra pasta do computador) e só traga para cá o arquivo final que for ao ar.

## Atualizar

```bash
bash .claude/update-skills.sh            # reinstala nas versões fixadas
bash .claude/update-skills.sh --latest   # pega a versão mais nova de cada repositório
```

Cada skill mantém o LICENSE do projeto original.
