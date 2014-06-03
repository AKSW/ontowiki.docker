#!/bin/sh

service virtuoso-opensource-6.1 start
service php5-fpm start
service nginx start

sleep 100s
