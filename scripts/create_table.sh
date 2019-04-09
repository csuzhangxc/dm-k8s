#!/bin/bash

default_password=""
schema="test_1"
table="t_1"
namespace="dm-test"

read -r -d '' create_table_stmt << EOM
create table if not exists $schema.$table (id bigint,
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

function create_table() {
    MYSQL_PWD=$default_password mysql -h $1 -u root -e "create database if not exists $schema"
    echo $create_table_stmt
    MYSQL_PWD=$default_password mysql -h $1 -u root -e "$create_table_stmt"
}

ips=$(kubectl get pods -n $namespace -o wide|grep -E '^mysql'|awk '{print $6}')
for ip in $ips; do
    echo $ip
    create_table $ip
done
