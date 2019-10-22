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

RUN git clone --recursive https://github.com/apache/mesos.git /src/mesos --branch 1.8.1

RUN mkdir /src/mesos/build
WORKDIR /src/mesos/build

RUN cmake3 ..
RUN make -j4
