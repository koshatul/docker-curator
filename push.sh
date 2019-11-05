#!/bin/bash

TAG="${1}"
shift 

docker push "koshatul/curator:${TAG}"
