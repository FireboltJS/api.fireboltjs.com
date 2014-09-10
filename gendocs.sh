#!/bin/bash

./tools/jsdoc-runner.sh
php ./tools/srcdir-fixer.php "$PWD/src/"
java -jar ./tools/htmlcompressor.jar --type html -o ./dist/ ./dist/
firefox ./dist/index.html &
# wait for Firefox to load
sleep 4
exit
