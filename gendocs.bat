CALL tools\jsdoc-runner.bat
php tools\srcdir-fixer.php "%CD%/src/"
java -jar tools\htmlcompressor.jar --type html -o ./dist/ ./dist/
.\dist\index.html
