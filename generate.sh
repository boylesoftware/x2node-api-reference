#!/bin/sh

MODULES=`find .. -mindepth 1 -maxdepth 1 -type d -name 'x2node-*'`

exec ./node_modules/.bin/jsdoc \
-c ./jsdoc-conf.json \
-d ./docs \
-t ./node_modules/ink-docstrap/template \
-a public,undefined \
$MODULES
