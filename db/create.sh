#!/bin/sh

if [ "$1" = "travis" ]
then
    psql -U postgres -c "CREATE DATABASE examen_test;"
    psql -U postgres -c "CREATE USER examen PASSWORD 'examen' SUPERUSER;"
else
    [ "$1" != "test" ] && sudo -u postgres dropdb --if-exists examen
    [ "$1" != "test" ] && sudo -u postgres dropdb --if-exists examen_test
    [ "$1" != "test" ] && sudo -u postgres dropuser --if-exists examen
    sudo -u postgres psql -c "CREATE USER examen PASSWORD 'examen' SUPERUSER;"
    [ "$1" != "test" ] && sudo -u postgres createdb -O examen examen
    sudo -u postgres createdb -O examen examen_test
    LINE="localhost:5432:*:examen:examen"
    FILE=~/.pgpass
    if [ ! -f $FILE ]
    then
        touch $FILE
        chmod 600 $FILE
    fi
    if ! grep -qsF "$LINE" $FILE
    then
        echo "$LINE" >> $FILE
    fi
fi
