# Derived from official mysql image (our base image)
FROM mysql
# Add a database
ENV MYSQL_ROOT_PASSWORD=tec
ENV MYSQL_DATABASE restaurant-rdb
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=tec
# Add the content of the sql-scripts/ directory to your image
# All scripts in docker-entrypoint-initdb.d/ are automatically
# executed during container startup
COPY my.cnf /etc/mysql/
COPY ./sql-scripts/ /docker-entrypoint-initdb.d/
COPY create-csv.sql /
