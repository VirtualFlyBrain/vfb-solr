FROM solr:8-slim

# Heap: default 512m is wildly undersized for the VFB index.
# Host has ~230 GB physical RAM, so we can be generous.
# Rule of thumb: heap large enough for indexing/query working set,
# but leave the bulk of RAM to the OS page cache (Lucene mmaps the index).
ENV SOLR_HEAP=16g

# Pass Solr system properties via SOLR_OPTS (the entrypoint reads this;
# bare `ENV solr.foo=...` lines are silently ignored by Solr).
ENV SOLR_OPTS="-Dsolr.allowPaths=* -Dsolr.jetty.request.header.size=65536 -Dsolr.jetty.response.header.size=65536"

ENV SOLR_ULIMIT_CHECKS=false
ENV SOLR_LOG_LEVEL=WARN

ENV solr.allowPaths='*'
