<?php include("libraries/app.php");
$restaurants = Restaurant::paginate(15);
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

<h1>Restaurant</h1>

<table class="table table-striped table-bordered table-hover">
<thead>
	<tr><td>View</td><td>name</td><td>rating</td><td>neighborhood</td><td>address</td><td>telephone</td></tr>
</thead>
<tbody>
<?php
	foreach($restaurants["data"] as $r) {
?>
	<tr><td><a href="restaurant.php?name=<?=urlencode($r->name)?>"><button type="button" class="btn btn-success">View</button></a></td><td><?=$r->name?></td><td><?=$r->rating?></td><td><?=$r->neighborhood?></td><td><?=$r->address?></td><td><?=$r->telephone?></td></tr>
<?php
	}
?>
</tbody>
</table>

<?php echo pageslider("index.php", $restaurants["last_page"], $restaurants["current_page"], $restaurants["next_page"], $restaurants["total_page"]); ?>
</div>

</body>
</html>
