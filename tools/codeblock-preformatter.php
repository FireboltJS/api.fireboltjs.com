<?php

echo "\nPreformatting ``` code blocks...\n";

$files = glob("./src/*");

foreach ($files as $file) {
	$text = preg_replace_callback(
		"/```(?:(javascript|js|html|xml))?[\s*]+(.*?)\s+```/s",
		function ($matches) {
			global $file;
			$highlight = $matches[1][0] === 'j' ? 'javascript' : 'xml';
			$content = pathinfo($file)['extension'] == 'md' ? htmlspecialchars($matches[2]) : $matches[2];
			return '<pre class="sunlight-highlight-'.$highlight.'">'.$content.'</pre>';
		},
		file_get_contents($file)
	);
	file_put_contents($file, $text);
}

echo "Done!\n\n";

?>
