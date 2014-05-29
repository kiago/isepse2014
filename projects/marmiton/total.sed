/.*<div class="m_search_titre_recette"><a href=.*>\(.*\)<\/a><\/div>/ { s//\1/p;}
/.*<div class="m_search_nb_votes">(\([0-9]*\) vote[s]\{0,1\})<\/div>/ { s//\1/p;}
/.*<div class="m_search_type_plat">\(.*\)<\/div>/ { s//\1/p;}
/.*<div class="m_search_tps_prepa">.*<\/strong>\([0-9]*\)mn<\/div>/ { s//\1/p;}
/.*<div class="m_search_tps_cuisson">.*<\/strong>\([0-9]*\)mn<\/div>/ { s//\1/p;}
/.*<div class="m_search_result_part4">/,/<\/div>/ {
	N
	/.*(pour \([0-9]*\) personnes).*/{ s//\1/p};
}