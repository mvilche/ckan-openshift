FROM solr:6.6.5
USER root
RUN mkdir -p /opt/solr/server/solr/ckan/conf /opt/solr/server/solr/ckan/data
COPY solrconfig.xml \
schema.xml \
elevate.xml \
protwords.txt \
stopwords.txt \
synonyms.txt \
core.properties \
/opt/solr/server/solr/ckan/
RUN cp /opt/solr/server/solr/ckan/schema.xml /opt/solr/server/solr/ckan/conf/ && chown solr:solr -R /opt/solr/server/solr/ckan
RUN chown -R 8983 /opt && \
chgrp -R 0 /opt && \
chmod -R g=u /opt
EXPOSE 8983
USER 8983
