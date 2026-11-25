#!/usr/bin/env bash
# Baixa (ou atualiza) as skills de vídeo/animação/som em .claude/skills/.
# Uso: bash .claude/update-skills.sh            -> usa os commits fixados abaixo
#      bash .claude/update-skills.sh --latest   -> pega a versão mais nova de cada repo
# Nada aqui faz parte do site: o Netlify não publica /.claude (ver _redirects).
set -euo pipefail
cd "$(dirname "$0")"
LATEST=${1:-}
TMP=$(mktemp -d); trap 'rm -rf "$TMP"' EXIT

# nome-da-skill | repositório | commit fixado | pasta da skill dentro do repo
SKILLS="
huashu-motion|alchaincyf/huashu-motion|f4f38bfe295a3f768753857be9236cc3277c7dad|skills/huashu-motion
rossark-motion-skill|rossark0/rossark-motion-skill|9b20964e32f07f8ac7e2948cd175746fa4a7712f|.
take-one|talsiach/take-one|38eb9030c88d14c12360889cd8317f8ffb81e9ab|.
reanimate|NiazMorshed2007/reanimate|3f7a55a2986a84ca2173e86ee9127eefe31d046d|skills/reanimate
argo-guide|shreyaskarnik/argo|5f715496522c4e682f4dc4aeffae5528e866ad5e|skills/argo-guide
explainroo|vincentsch/explainroo|195f918a2dbecdda83e4f0741229a63fe2ab45e0|skills/explainroo
video-director|win4r/video-director|02d1912ab251bf5235b45e8e7aad81b4bc786b15|video-director
earshot|Leonxlnx/earshot|7a7f7c5c70d4a763a1eca4b3666af7c77e313f97|skills/earshot
real-sound|Leonxlnx/earshot|7a7f7c5c70d4a763a1eca4b3666af7c77e313f97|skills/real-sound
"

mkdir -p skills
echo "$SKILLS" | while IFS='|' read -r name repo sha sub; do
  [ -z "$name" ] && continue
  src="$TMP/${repo//\//_}"
  if [ ! -d "$src" ]; then
    git clone -q "https://github.com/$repo.git" "$src"
    [ "$LATEST" = "--latest" ] || git -C "$src" checkout -q "$sha"
  fi
  rm -rf "skills/$name"
  mkdir -p "skills/$name"
  (cd "$src/$sub" && tar --exclude=.git --exclude=node_modules -cf - .) | tar -xf - -C "skills/$name"
  [ -e "skills/$name/LICENSE" ] || cp "$src/LICENSE" "skills/$name/LICENSE"
  # rossark: GIF/MP4 de demonstração só servem ao README do projeto (~10 MB)
  [ "$name" = rossark-motion-skill ] && rm -f skills/$name/demo/*.gif skills/$name/demo/*.mp4
  echo "ok  $name  <- $repo@$(git -C "$src" rev-parse --short HEAD) ($sub)"
done
