<?php

class Model {
	
	public static function findWhere($where, $fields = array('*')) {
		//get main table
		$childclass = get_called_class();
		$vars = get_class_vars($childclass);
		$table = $vars["table"];
		
		//array
		$keys = array_keys($where);
		$vals = array_values($where);
		$where = "";
		
		for($i = 0; $i < count($keys); $i++) {
			$where .= $keys[$i] . "=? AND ";
		}
		$where = substr($where, 0, -5);
		
		//read row
		$stmt = App::$DB->prepare("SELECT " . implode($fields, ', ') . " FROM $table WHERE $where");
		for($i = 0; $i < count($keys); $i++) {
			$stmt->bindValue($i + 1, $vals[$i], PDO::PARAM_STR);
		}
		$stmt->execute();
		return $stmt->fetchAll(PDO::FETCH_CLASS, $table);
	}
	
	public static function find($id, $fields = array('*')) {
		//get main table & pk
		$childclass = get_called_class();
		$vars = get_class_vars($childclass);
		$table = $vars["table"];
		$primary = $vars["primary"];
		
		//read row
		$stmt = App::$DB->prepare("SELECT " . implode($fields, ', ') . " FROM $table WHERE $primary=?");
		$stmt->bindParam(1, $id, PDO::PARAM_STR);
		$stmt->execute();
		return $stmt->fetch(PDO::FETCH_ASSOC);
	}
	
	public static function all($fields = array('*')) {
		//get main table & pk
		$childclass = get_called_class();
		$vars = get_class_vars($childclass);
		$table = $vars["table"];
		//read row
		$stmt = App::$DB->prepare("SELECT " . implode($fields, ', ') . " FROM $table");
		$stmt->execute();
		return $stmt->fetchAll(PDO::FETCH_CLASS, $table);
	}
	
	public static function paginate($item, $fields = array('*')) {
		if(isset($_GET["page"])) $page = intval($_GET["page"]); else $page = 1;
		
		//get main table
		$childclass = get_called_class();
		$vars = get_class_vars($childclass);
		$table = $vars["table"];
		
		//cal the limit
		$start = $item * ($page - 1);
		$item = intval($item);
		
		//read table by limit
		$stmt = App::$DB->prepare("SELECT SQL_CALC_FOUND_ROWS " . implode(", ", $fields) . " FROM $table LIMIT ?,?");
		$stmt->bindParam(1, $start, PDO::PARAM_INT);
		$stmt->bindParam(2, $item, PDO::PARAM_INT);
		$stmt->execute();
		
		//read num of rows
		$stmt2 = App::$DB->prepare("SELECT FOUND_ROWS() AS TOTAL_NUM");
		$stmt2->execute();
		$result = $stmt2->fetch();
		return array(
			"last_page" => ($page <= 1 ? -1 : $page - 1),
			"next_page" => ($page >= ceil(intval($result["TOTAL_NUM"]) / $item) ? -1 : $page + 1),
			"current_page" => $page,
			"total_page" => ceil(intval($result["TOTAL_NUM"]) / $item),
			"data" => $stmt->fetchAll(PDO::FETCH_CLASS, $table)
			);
	}
}
