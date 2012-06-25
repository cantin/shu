#! /bin/bash

echo "Input database name:"
read db_name

echo "Input new user's name:"
read user

echo "Input user's password:"
stty -echo
read password
stty echo

echo "Input mysql root's password: "

mysql -u root -p <<EOF
  create database $db_name default character set utf8;
  create user $user identified by '$password';
  grant all privileges on $db_name.* to $user;

  show grants for $user;
EOF
