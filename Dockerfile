FROM centos:7
WORKDIR /root/
RUN yum install -y autoconf automake libtool make git           \
    && yum install -y centos-release-scl                        \
    && yum install -y devtoolset-8-gcc*                         \
    && scl enable devtoolset-8 bash                             \
    && git clone https://github.com/curl/curl.git               \
    && cd curl/                                                 \
    && git checkout curl-7_70_0                                 \
    && ./buildconf                                              \
    && mkdir build/ && cd build/                                \
    && CFLAGS=-Werror ../configure                              \
    && make && make install                                     \
    && yum clean all
