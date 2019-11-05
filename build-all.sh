#!/bin/bash

set -o pipefail

DOCKER_TAGS="$(curl -sSL 'https://hub.docker.com/v2/repositories/koshatul/curator/tags?page_size=1000')"
CURATOR_TAGS="$(curl -sSL 'https://api.github.com/repos/elastic/curator/releases')"
for TAG in $(echo "${CURATOR_TAGS}" | jq -r '.[].tag_name' | tac); do
    echo "## Checking version ${TAG}"
    echo ${DOCKER_TAGS} | jq -r '.results[].name' | grep -qE "^${TAG}$"
    if [[ ${?} != 0 ]]; then
        echo "++ Building version ${TAG}"
        set -e
        ./build.sh "${TAG}"
        # ./push.sh "${TAG}"
        set +e
    fi
done
