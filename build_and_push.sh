#! /bin/sh

set -e

if [ -z "${MESOS_VERSION}" ]; then
  echo MESOS_VERSION must be defined
  exit 2
fi

if [ -z "${MESOS_GIT}" ]; then
  echo MESOS_GIT must be defined
  exit 2
fi

if [ -z "${DOCKER_REPO}" ]; then
  echo DOCKER_REPO must be defined
  exit 2
fi

docker build -t "${DOCKER_REPO}":"${MESOS_VERSION}" --build-arg MESOS_VERSION="${MESOS_VERSION}" --build-arg MESOS_GIT="${MESOS_GIT}" .
docker push "${DOCKER_REPO}":"${MESOS_VERSION}"
