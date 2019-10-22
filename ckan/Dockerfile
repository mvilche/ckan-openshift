FROM alpine:3.9
ENV PYTHON_VERSION=python2 CKAN_VERSION=ckan-2.8.2 CKAN_REPO=git+https://github.com/ckan/ckan.git@$CKAN_VERSION#egg=ckan
RUN mkdir -p /opt && apk add --no-cache --update $PYTHON_VERSION libmagic curl busybox-extras musl-dev py2-psycopg2 shadow busybox-suid tzdata postgresql-dev postgresql py2-pip git gcc libxml2 libxml2-dev python2-dev tiff-dev
RUN pip install --upgrade pip && pip install setuptools==36.1 && cd /opt && pip install -e $CKAN_REPO && pip uninstall python-magic && pip install python-magic && pip install ckanapi && \
cd /opt/src/ckan && pip install -r requirements.txt
COPY run.sh /usr/bin/run.sh
RUN adduser -u 1001 -h /opt/src/ckan -S ckan && rm -rf /etc/localtime && \
touch /etc/timezone /etc/localtime && \
chown -R 1001 /opt /etc/timezone /etc/localtime /usr/bin/run.sh && \
chgrp -R 0  /opt /etc/timezone /etc/localtime /usr/bin/run.sh  && \
chmod -R g=u /opt /etc/timezone /etc/localtime /usr/bin/run.sh
WORKDIR /opt/src/ckan
EXPOSE 5000
USER 1001
ENTRYPOINT ["/usr/bin/run.sh"]
CMD ["/opt/src/ckan/config/production.ini"]
