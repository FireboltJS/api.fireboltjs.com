<?php

echo "\nFixing Source paths...\n";

$srcdirPath = str_replace("\\", "/", $argv[1]);

$files = glob("./dist/*.html");

foreach ($files as $file) {
	$text = str_replace($srcdirPath, "", file_get_contents($file));
	file_put_contents($file, str_replace("Firebolt(2)", "Firebolt", $text));
}

echo "Done!\n\n";

?>
