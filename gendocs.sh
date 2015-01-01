#!/bin/bash

./tools/jsdoc-runner.sh
php ./tools/srcdir-fixer.php "$PWD/src/"
java -jar ./tools/htmlcompressor.jar --type html -o ./dist/ ./dist/
cd dist
php -S localhost:8000 &
PID=$!
echo PHP server running with PID: $PID
x-www-browser http://localhost:8000
kill $PID
