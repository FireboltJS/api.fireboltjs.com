CALL tools\jsdoc-runner.bat
php tools\srcdir-fixer.php "%CD%/src/"
java -jar tools\htmlcompressor.jar --type html -o ./dist/ ./dist/
cd dist
START "Local PHP Server" /MIN php -S localhost:8000
START http://localhost:8000
