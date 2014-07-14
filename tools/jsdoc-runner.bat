@echo off

SET OUTPUT_DIR=.\dist
SET INPUT_DIR=.\src

REM Working Copy, contents not be altered
SET ORIGINAL_SOURCE=..\Firebolt\src

IF EXIST "%INPUT_DIR%" (
	echo Erasing old sources
	del /F/S/Q "%INPUT_DIR%"
) ELSE (
	echo "Making %INPUT_DIR% directory"
	md "%INPUT_DIR%"
)

IF EXIST "%OUTPUT_DIR%" (
	echo Erasing old documentation
	del /F/S/Q "%OUTPUT_DIR%"
) ELSE (
	echo "Making %OUTPUT_DIR% directory"
	md "%OUTPUT_DIR%"
)

echo Coping new Sources
xcopy /E /Y /C /I /H /R /Q "%ORIGINAL_SOURCE%\*.js" "%INPUT_DIR%"
COPY /Y "templates\landing-page-readme.md" "%INPUT_DIR%\README.md"

REM Preformat ``` code blocks
php tools\codeblock-preformatter.php

echo JSDOC!
.\jsdoc\jsdoc -c conf.json -d "%OUTPUT_DIR%" "%INPUT_DIR%" "%INPUT_DIR%\README.md" 2> jsdoc_errors.log
echo          Done!
