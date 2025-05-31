#!/bin/bash
source .env

usage()
{
    echo "Please declare variable in '.env':"
    echo "   DEBUGEE_IMAGE_ORIG"
    echo "   DEBUGEE_IMAGE_PATCHED"
    echo "   DEBUGEE_IMAGE_FLAVOR={debian,fedora}"
    echo "And run ${0} again after 1st attempt of starting docker compose (to create certificates in ./cert)"
}

echo "ORIG=${DEBUGEE_IMAGE_ORIG}"

if [[ (-z ${DEBUGEE_IMAGE_ORIG}) || (-z ${DEBUGEE_IMAGE_PATCHED}) || (-z ${DEBUGEE_FLAVOR}) ]];then
    usage
    exit 1
fi

echo "docker build -t ${DEBUGEE_IMAGE_PATCHED} --build-arg DEBUGEE_IMAGE_ORIG=${DEBUGEE_IMAGE_ORIG} --file debugee/${DEBUGEE_FLAVOR}.Dockerfile ."

docker build -t ${DEBUGEE_IMAGE_PATCHED} --build-arg DEBUGEE_IMAGE_ORIG=${DEBUGEE_IMAGE_ORIG} --file debugee/${DEBUGEE_FLAVOR}.Dockerfile .
