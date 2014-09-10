#!/bin/bash

OUTPUT_DIR=./dist
INPUT_DIR=./src

# Working Copy, contents will not be altered
ORIGINAL_SOURCE=../Firebolt/src

if [ -d "$INPUT_DIR" ]; then
	echo Erasing old sources
	rm -rf "$INPUT_DIR/*"
else
	echo "Making $INPUT_DIR directory"
	mkdir -m 7770 "$INPUT_DIR"
fi

if [ -d "$OUTPUT_DIR" ]; then
	echo Erasing old documentation
	rm -rf "$OUTPUT_DIR/*"
else
	echo "Making $OUTPUT_DIR directory"
	mkdir -m 7770 "$OUTPUT_DIR"
fi

echo Coping new Sources
cp "$ORIGINAL_SOURCE/firebolt.js" "$INPUT_DIR"
cp "templates/landing-page-readme.md" "$INPUT_DIR/README.md"

# Preformat ``` code blocks
php tools/codeblock-preformatter.php

echo JSDOC!
./jsdoc/jsdoc -c conf.json -d "$OUTPUT_DIR" "$INPUT_DIR" "$INPUT_DIR/README.md"

echo Done!
