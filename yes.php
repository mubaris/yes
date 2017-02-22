<?php

if (is_null($argv[1])) {
	while (true) {
		echo "y\n";
	}
} else {
		$output =  implode(" ", array_slice($argv,1)) . "\n";
	while (true) {
		echo $output;
	}
}
