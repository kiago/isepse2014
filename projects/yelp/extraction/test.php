<?php
	$file = file_get_contents("result", "r");
	preg_match_all("/^\d\d?(\n.+)/", $file, $m);
	var_dump($m);
