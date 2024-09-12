FROM mysql:8.0

COPY tlcn.sql /docker-entrypoint-initdb.d/

ENV MYSQL_DATABASE=tlcn
ENV MYSQL_ROOT_PASSWORD=12345

EXPOSE 3306