/.*<div class="m_search_result_part4">/,/<\/div>/ {
	N
	/.*(pour \([0-9]*\) personnes).*/{ s//\1/p};
}
