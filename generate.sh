#!/bin/sh

MODULES=""
for m in `find .. -mindepth 1 -maxdepth 1 -type d -name 'x2node-*'`; do
    if [ -f $m/package.json -a -z "$(grep -s '"private": true' $m/package.json)" ]; then
        MODULES="$MODULES $m";
    fi
done

rm -rf ./docs/*

exec ./node_modules/.bin/jsdoc \
-c ./jsdoc-conf.json \
-R README.md \
-d ./docs \
-t ./node_modules/ink-docstrap/template \
-a public,undefined \
$MODULES
