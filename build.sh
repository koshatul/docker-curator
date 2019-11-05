#!/bin/bash

TAG="${1}"
shift

SRCDIR="$(pwd -P)"
echo "++ Source Directory: ${TMPDIR}"

mkdir workdir
TMPDIR="$(cd workdir; pwd -P)"
# TMPDIR="$(mktemp -d)"
echo "++ Temporary Directory: ${TMPDIR}"

cd "${TMPDIR}"
echo "++ Setting up repository"
if [[ ! -d "${TMPDIR}/.git" ]]; then
    echo "++ Cloning repository"
    git clone --branch "${TAG}" "https://github.com/elastic/curator.git" "${TMPDIR}"
else
    echo "++ Resetting and checking out repository tag"
    ( cd "${TMPDIR}"; git reset --hard HEAD; git checkout "${TAG}" )
fi

echo "++ Checking for overrides"
if [[ -d "${SRCDIR}/override/${TAG}" ]]; then
    echo "++ Copying overrides"
    ( cd "${SRCDIR}/override/${TAG}"; tar cf - .) | tar xvf -
fi

echo "++ Building koshatul/curator:${TAG}"
docker build -t koshatul/curator:${TAG} .
# cd 
# echo "++ Removing build directory"
# rm -rf "${TMPDIR}"