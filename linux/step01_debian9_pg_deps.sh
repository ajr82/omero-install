#!/bin/bash

PGVER=${PGVER:-pg11}

if [ "$PGVER" = "pg96" ]; then
    # Postgres installation: version installed will be 9.6
    apt-get -y install postgresql
    service postgresql start
elif [ "$PGVER" = "pg10" ]; then
    apt-get install -y gnupg
    echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
    apt-get update
    apt-get install -y postgresql-10
    service postgresql start
elif [ "$PGVER" = "pg11" ]; then
    #start-recommended
    apt-get install -y gnupg
    echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
    apt-get update
    apt-get install -y postgresql-11
    service postgresql start
    #end-recommended
elif [ "$PGVER" = "pg12" ]; then
    apt-get install -y gnupg
    echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
    apt-get update
    apt-get install -y postgresql-12
    service postgresql start
fi
