FROM freeradius/freeradius-server:3.0.18

COPY raddb/ /etc/raddb/

# define build args
ARG server
ARG port
ARG username
ARG password
ARG database

# env vars
ENV MYSQL_SERVER $server
ENV MYSQL_PORT $port
ENV MYSQL_USERNAME $username
ENV MYSQL_PASSWORD $password
ENV MYSQL_DATABASE $database

#RUN sed -i -s "s/server =.*/server = ${server}/" /etc/raddb/mods-available/sql
#RUN sed -i -s "s/port =.*/port =${port}/" /etc/raddb/mods-available/sql
#RUN sed -i -s "s/login =.*/login =${username}/" /etc/raddb/mods-available/sql
#RUN sed -i -s "s/password =.*/password =${password}/" /etc/raddb/mods-available/sql
#RUN sed -i -s "s/radius_db =.*/radius_db =${database}/" /etc/raddb/mods-available/sql

RUN ln -s /etc/raddb/mods-available/sql /etc/raddb/mods-enabled/sql

ADD bootstrap.sh /bin/bootstrap.sh
ENTRYPOINT [ "/bin/bootstrap.sh" ]
