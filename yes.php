<?php
$out = "y\n";
if (!is_null($argv[1])) {
	$out = implode(" ", array_slice($argv, 1)) . "\n";
}
while (true) {
	echo $out;
}
