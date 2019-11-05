#!/bin/bash

CURATOR_TAGS="$(curl -sSL 'https://api.github.com/repos/elastic/curator/releases')"
for TAG in $(echo "${CURATOR_TAGS}" | jq -r '.[].tag_name' | tac); do
    echo -n "${TAG}:"
    docker run -ti --rm "koshatul/curator:${TAG}" --version
done
