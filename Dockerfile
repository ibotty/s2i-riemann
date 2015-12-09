# riemann-build
FROM openshift/base-centos7

MAINTAINER Tobias Florek <tob@butter.sh>

ENV RIEMANN_VERSION 0.2.10 \
ENV RIEMANN_TAR_URL https://aphyr.com/riemann/riemann-${RIEMANN_VERSION}.tar.bz2 

LABEL io.k8s.description="Platform for building a Riemann monitoring server" \
      io.k8s.display-name="Riemann builder ${RIEMANN_VERSION}" \
      io.openshift.expose-services="5555:tcp,5555:udp,5556:http" \
      io.openshift.tags="builder,riemann,${RIEMANN_VERSION},monitoring,alerting" \
      io.openshift.non-scalable=true

RUN yum install -y --setopt=tsflags=nodocs bzip2 java-1.8.0-openjdk-headless \
 && yum clean all -y \
 && curl -L ${RIEMANN_TAR_URL} | tar xjC /opt 

COPY ./.s2i/bin/ ${STI_SCRIPTS_PATH}

RUN chown -R 1001:1001 /opt/app-root

# This default user is created in the openshift/base-centos7 image
USER 1001

EXPOSE 5555/tcp 5555/udp 5556/tcp

CMD ["usage"]
