<?php
switch ($argv[1]) {
	case null:
		$out = "y\n";
	break;
	default:
		$out = implode(" ", array_slice($argv, 1)) . "\n";
	break;
}
while (true) {
	echo $out;
}
