<?php include("libraries/app.php");
if(!isset($_GET["name"])) exit;
$name = $_GET["name"];
$restaurant = Restaurant::find($name);
$images = Food_image::findWhere(array("restaurant_name" => $name));
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

<h1><?=$name?></h1>

<table class="table">
<tbody>
	<tr><td width="20%">Rating:</td><td><?=$restaurant["rating"]?></td></tr>
	<tr><td>Neighborhood:</td><td><?=$restaurant["neighborhood"]?></td></tr>
	<tr><td>Address:</td><td><?=$restaurant["address"]?></td></tr>
	<tr><td>Location:</td><td><img src="http://maps.googleapis.com/maps/api/staticmap?center=<?=$restaurant["longitude"]?>,<?=$restaurant["latitude"]?>&zoom=14&size=400x400&markers=color:blue|<?=$restaurant["longitude"]?>,<?=$restaurant["latitude"]?>" /></td></tr>
	<tr><td>Foods:</td><td><?php foreach($images as $image) {
		echo $image->title . "<br /><img src=\"" . $image->link . "\" /><br /><br />";
	} ?></td></tr>
</tbody>
</table>

</div>

</body>
</html>
