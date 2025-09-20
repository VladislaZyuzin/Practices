#!/bin/bash
redis-cli subscribe channel_1 | while read line
do 
    echo "$line"
done
