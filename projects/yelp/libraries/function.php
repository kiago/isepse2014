<?php

function pageslider($page, $last, $current, $next, $total) {
	$li = function($class, $href, $content) {
		if($class == "")
			return "<li><a href='$href'>$content</a></li>";
		else if($class == "active")
			return "<li class='$class'><a href='$href'>$content<span class='sr-only'>(current)</span></a></li>";
		else
			return "<li class='$class'><a href='$href'>$content</a></li>";
	};
	$html = "<div class='text-center'>";
	$html .= "<ul class='pagination'>";
	
	if($last == -1)
		$html .= $li("disabled", "#", "&laquo;");
	else
		$html .= $li("", "$page?page=$last", "&laquo;");
	
	if($current > 3)
		$html .= $li("disabled", "#", "...");
	
	for($i = $current - 2; $i < $current + 2; $i++) {
		if($i < 1 || $i > $total) continue;
		if($i == $current)
			$html .= $li("active", "$page?page=$i", "$i");
		else
			$html .= $li("", "$page?page=$i", "$i");
	}
	
	if($current < $total - 2)
		$html .= $li("disabled", "#", "...");
	
	if($next == -1)
		$html .= $li("disabled", "#", "&raquo;");
	else
		$html .= $li("", "$page?page=$next", "&raquo;");
	
	$html .= "</ul>";
	$html .= "</div>";
	
	return $html;
}
