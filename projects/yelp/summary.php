<?php include("libraries/app.php");
$restaurants = Restaurant::all();

/**
 * Array add-on function
 */
$array_count = function($items, $callback) {
	$carry = array();
	foreach($items as $item) {
		$carry = $callback($carry, $item);
	}
	arsort($carry);
	return $carry;
};

$array_sum = function($items, $callback) {
	$sum = 0;
	foreach($items as $item) {
		$sum += $callback($item);
	}
	return $sum;
};

/* Count restaurant for each arrondissement,
 * and get which arrondissement has the most best rating restaurant
 * and the number of restaurant in the arrondissement
 */


$neighborhood_count = $array_count($restaurants, function($carry, $restaurant) {
	preg_match("/([0-9][0-9]?)(er|ème)/", $restaurant->neighborhood, $m);
	if(isset($carry))
		$carry[$m[1]]++;
	else
		$carry[$m[1]] = 1;
	return $carry;
});
$arrondissement = array_shift(array_keys($neighborhood_count));
$num_best_restaurants = array_shift(array_values($neighborhood_count));

/* Get the coordinates of all the restaurants in that arrondissement
 */
$rests_to_arro = array();
$coordinates = array();
$coordinates_tostring = "";
$coordinates_tostring = substr($coordinates_tostring, 0, -1);
foreach($restaurants as $restaurant) {
	if(preg_match("/ $arrondissement(er|ème)/", $restaurant->neighborhood)) {
		$coordinates[] = array("longitude" => $restaurant->longitude, "latitude" => $restaurant->latitude);
		$coordinates_tostring .= $restaurant->latitude . ',' . $restaurant->longitude . '|';
		$rests_to_arro[] = $restaurant;
	}
}

$longitude_sum = $array_sum($coordinates, function($coordinate) {
	return $coordinate["longitude"];
});
$latitude_sum = $array_sum($coordinates, function($coordinate) {
	return $coordinate["latitude"];
});
$center = array("longitude" => $longitude_sum / count($coordinates), "latitude" => $latitude_sum / count($coordinates));
?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Yelp Page</title>
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css" />
	<script src="assets/js/jquery-1.11.1.min.js"></script>
</head>
<body>

<div class="container">

<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<a class="navbar-brand" href="index.php">YELP</a>
	</div>
	<ul class="nav navbar-nav">
		<li><a href="index.php">Restaurant</a></li>
		<li><a href="summary.php">Summary</a></li>
	</ul>
</nav>

<h1>Summary</h1>

The most rating restaurants are in <?=$arrondissement?><?=$arrondissement==1?'er':'ème'?> arrondissement. There are <?=$num_best_restaurants?> good rating restaurants. The following map locates all the best restaurant in this arrondissement.
<br />
<br />

<img src="http://maps.googleapis.com/maps/api/staticmap?center=<?=$center["latitude"]?>,<?=$center["longitude"]?>&zoom=14&size=1080x540&markers=color:blue|<?=$coordinates_tostring?>" />

<br />
<br />

The following restaurants are in <?=$arrondissement?><?=$arrondissement==1?'er':'ème'?> arrondissement. Click View Button to find the good food, yummy!!!

<br />
<br />

<table class="table table-striped table-bordered table-hover">
<thead>
	<tr><td>View</td><td>name</td><td>rating</td><td>neighborhood</td><td>address</td></tr>
</thead>
<tbody>
<?php
	foreach($rests_to_arro as $rest_to_arro) {
?>
	<tr><td><a href="restaurant.php?id=<?=urlencode($rest_to_arro->id)?>"><button type="button" class="btn btn-success">View</button></a></td><td><?=$rest_to_arro->name?></td><td><?=$rest_to_arro->rating?></td><td><?=$rest_to_arro->neighborhood?></td><td><?=$rest_to_arro->address?></td></tr>
<?php
	}
?>
</tbody>
</table>

</body>
</html>
