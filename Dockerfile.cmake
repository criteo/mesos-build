FROM centos:7.6.1810

RUN yum -y install epel-release
RUN yum -y install \
  apr-devel \
  cmake3 \
  curl-devel \
  cyrus-sasl-devel \
  gcc-c++ \
  git \
  make \
  mlocate \
  patch \
  subversion-devel \
  vim \
  zlib-devel

RUN alternatives \
  --install /usr/local/bin/cmake cmake /usr/bin/cmake3 20 \
  --slave /usr/local/bin/ctest ctest /usr/bin/ctest3 \
  --slave /usr/local/bin/cpack cpack /usr/bin/cpack3 \
  --slave /usr/local/bin/ccmake ccmake /usr/bin/ccmake3 \
  --family cmake

ARG MESOS_GIT=https://github.com/apache/mesos.git
ARG MESOS_VERSION=1.8.1

RUN git clone --recursive ${MESOS_GIT} /src/mesos --branch ${MESOS_VERSION}

RUN mkdir /src/mesos/build
WORKDIR /src/mesos/build

RUN cmake ..
RUN make -j "$(nproc)"
