<?php include("libraries/app.php");
if(!isset($_GET["id"])) exit;
$id = $_GET["id"];
$restaurant = Restaurant::find($id);
$images = Food_image::findWhere(array("restaurant_id" => $id));
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

<h1><?=$restaurant["name"]?></h1>

<table class="table">
<tbody>
	<tr><td width="20%">Rating:</td><td><?=$restaurant["rating"]?></td></tr>
	<tr><td>Neighborhood:</td><td><?=$restaurant["neighborhood"]?></td></tr>
	<tr><td>Address:</td><td><?=$restaurant["address"]?></td></tr>
	<tr><td>Location:</td><td><img src="http://maps.googleapis.com/maps/api/staticmap?center=<?=$restaurant["latitude"]?>,<?=$restaurant["longitude"]?>&zoom=16&size=400x400&markers=color:blue|<?=$restaurant["latitude"]?>,<?=$restaurant["longitude"]?>" /></td></tr>
	<tr><td>Foods:</td><td><?php foreach($images as $image) {
		echo $image->title . "<br /><img src=\"" . $image->link . "\" /><br /><br />";
	} ?></td></tr>
</tbody>
</table>

</div>

</body>
</html>
