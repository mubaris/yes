<?php

if (is_null($argv[1])) {
	while (true) {
		echo "y\n";
	}
} else {
	while (true) {
		echo implode(" ", array_slice($argv,1)) . "\n";
	}
}
