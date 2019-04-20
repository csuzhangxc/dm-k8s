#!/bin/bash

default_password=""
namespace="dm-test-2"
schemas=( "test_1" "test_2" "test_3" "test_4" )
tables=( "t_1" "t_2" "t_3" "t_4" "t_5" "t_6" )

function assemble_sql() {
    read -r -d '' create_table_stmt << EOM
create table if not exists $1.$2 (id bigint,
c1 varchar(60) not null,
c2 varchar(74) not null,
c3 datetime not null,
c4 bigint unsigned not null,
c5 float not null,
c6 boolean,
c7 char(104) not null,
c8 char(166) not null,
c9 timestamp not null,
c10 boolean,
c11 timestamp not null default NOW(),
c12 enum('a', 'b', 'c') not null,
c13 varchar(13) not null,
c14 set('a', 'b', 'c') not null,
c15 timestamp not null default NOW(),
c16 char(99) not null,
c17 boolean,
c18 varchar(220) not null,
PRIMARY KEY (\`id\`),
KEY (\`c15\`),
UNIQUE (\`c16\`),
KEY (\`c12\`),
UNIQUE (c5, c8, c16)
);
EOM
    echo $create_table_stmt
}

function create_table() {
    MYSQL_PWD=$default_password mysql -h $1 -u root -e "create database if not exists $2"
    stmt=$(assemble_sql $2 $3)
    MYSQL_PWD=$default_password mysql -h $1 -u root -e "$stmt"
}

ips=$(kubectl get pods -n $namespace -o wide|grep -E '^mysql'|awk '{print $6}')
for ip in $ips; do
    echo $ip
    for schema in "${schemas[@]}"; do
        for table in "${tables[@]}"; do
            create_table $ip $schema $table
        done
    done
done
