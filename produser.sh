#!/bin/bash

a=1
b=2

c=$((a+b))

redis-cli publish channel_1 "Hellow from Bash! Count $c"