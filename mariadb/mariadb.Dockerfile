FROM docker.io/alpine:latest AS mariadb-server

RUN apk add --no-cache \
    mariadb \
    mariadb-client

RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql

# Habilita conexión por TCP
RUN sed -i '/skip-networking/s/$/=0/' /etc/my.cnf.d/mariadb-server.cnf
# Permite la conexión desde cualquier host
RUN sed -i '/\[mariadbd\]/a bind-address=0.0.0.0' /etc/my.cnf.d/mariadb-server.cnf

# Permite montar volumen para datos persistentes
VOLUME /var/lib/mysql

# Expone puerto de mariadb
EXPOSE 3306

# Copia y configura script al iniciar el contenedor
COPY ./entrypoint.sh .
ENTRYPOINT ["./entrypoint.sh"]
