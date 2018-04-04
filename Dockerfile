# ESA-STEP-SNAP 6 Dockerfile
# Copied from https://github.com/edwardpmorris/docker-snap 

FROM centos:7
LABEL author="jjylik jjylik@gmail.com"

COPY snap.varfile /tmp/

RUN groupadd -r snap \
    && useradd -r -g snap snap \
    && mkdir /home/snap \
    && yum -y install wget \
    && yum -y install which \
    && cd /home/snap \
    && wget http://step.esa.int/downloads/6.0/installers/esa-snap_all_unix_6_0.sh \
    && chmod +x /home/snap/esa-snap_all_unix_6_0.sh \
    && /home/snap/esa-snap_all_unix_6_0.sh -q -varfile /tmp/snap.varfile \
    && /home/snap/snap/bin/snappy-conf /usr/bin/python /usr/lib/python2.7/site-packages \
    && rm /home/snap/esa-snap_all_unix_6_0.sh \
    && chown -R snap:snap /home/snap


ENV PATH=$PATH:/home/snap/snap/bin \
    SNAP_PATH=/home/snap/snap/bin

WORKDIR /home/snap

USER snap
