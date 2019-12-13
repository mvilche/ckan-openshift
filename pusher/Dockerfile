FROM alpine:3.9

ENV PYTHON_VERSION=python2 CKAN_DATAPUSHER_VERSION=0.0.15 CKAN_DATAPUSHER_REPO=https://github.com/ckan/datapusher.git
RUN apk add --no-cache --update $PYTHON_VERSION openssl-dev shadow libxml2 busybox-suid libxml2-dev musl-dev libxslt-dev libffi-dev gcc tzdata py2-pip git python2-dev tiff-dev && \
pip install --upgrade pip && git clone -b $CKAN_DATAPUSHER_VERSION $CKAN_DATAPUSHER_REPO /opt/datapusher && cd /opt/datapusher && pip install -r requirements.txt && \
adduser -u 1001 -h /opt/app -S datapusher && \
rm -rf /var/cache/apk/*
RUN echo "SSL_VERIFY=False" >> /opt/datapusher/deployment/datapusher_settings.py && \
chown -R 1001 /opt && \
chgrp -R 0 /opt && \
chmod -R g=u /opt
WORKDIR /opt/datapusher
USER 1001
EXPOSE 8800
CMD [ "python", "/opt/datapusher/datapusher/main.py", "/opt/datapusher/deployment/datapusher_settings.py"]
