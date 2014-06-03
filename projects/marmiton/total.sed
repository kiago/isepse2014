/.*<div class="m_search_titre_recette"><a href=.*>\(.*\)<\/a><\/div>/ { s//\1/;h;}
/.*<div class="m_search_nb_votes">(\([0-9]*\) vote[s]\{0,1\})<\/div>/ { s//\1/;H;}
/.*<div class="m_search_type_plat">\(.*\)<\/div>/ { s//\1/;H;}
/.*<div class="m_search_tps_prepa">.*<\/strong>\([0-9]*\)mn<\/div>/ { s//\1/;H;}
/.*<div class="m_search_tps_cuisson">.*<\/strong>\([0-9]*\)mn<\/div>/ { s//\1/;H;}
/.*<div class="m_search_result_part4">/ {
	N
	/.*(pour \([0-9]*\) \(\w*\)).*/{ s//\1\r\n\2/;H;}
	g
	s/\r\n/;/gp
}
