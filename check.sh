#!/bin/bash

CURATOR_TAGS="$(curl -sSL 'https://api.github.com/repos/elastic/curator/releases')"
for TAG in $(echo "${CURATOR_TAGS}" | jq -r '.[].tag_name' | tac); do
    echo "## ${TAG}"
    docker pull "koshatul/curator:${TAG}" 2>&1 | sed -e 's/^/  /'
    docker run -ti --rm "koshatul/curator:${TAG}" --version 2>&1 | sed -e 's/^/  /'
    echo ""
done
