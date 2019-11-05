#!/bin/bash

set -eo pipefail

TAG="${1}"
shift 

docker push "koshatul/curator:${TAG}"
