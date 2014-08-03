<?php

echo "\nPreformatting ``` code blocks...\n";

$files = glob("./src/*");

foreach ($files as $file) {
	$text = preg_replace_callback(
		"/```(?:javascript\b|js\b)?(.*?)```/s",
		function ($matches) {
			global $file;
			return '<pre class="sunlight-highlight-javascript">'
					.(pathinfo($file)['extension'] == "md" ? htmlspecialchars($matches[1]) : $matches[1])
					."</pre>";
		},
		file_get_contents($file)
	);
	file_put_contents($file, $text);
}

echo "Done!\n\n";

?>
