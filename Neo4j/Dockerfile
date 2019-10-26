FROM neo4j:3.0

COPY /neo4j-scripts/data.cypher /var/lib/neo4j/

ENV NEO4J_AUTH=neo4j/password
ENV NEO4J_dbms_security_procedures_unrestricted=apoc.*
ENV NEO4J_ACCEPT_LICENSE_AGREEMENT=yes

#CMD bin/neo4j-shell -c <  data.cypher

