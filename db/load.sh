#!/bin/sh

BASE_DIR=$(dirname $(readlink -f "$0"))
if [ "$1" != "test" ]
then
    psql -h localhost -U examen -d examen < $BASE_DIR/examen.sql
fi
psql -h localhost -U examen -d examen_test < $BASE_DIR/examen.sql
