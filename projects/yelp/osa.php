<?php
    $name=array();
    $rating=array();
    $neighborhood=array();
    $address=array();
    $longitude=array();
    $latitude=array();
    $title=array();
    $link=array();
$file = file_get_contents("result.txt", "r");
$file = explode("%%", $file);
    for($i=0; $i<10; $i++)
        $file2[] = explode("||", $file[$i],2);
    for($i=0; $i<10; $i++){
        for($j=0; $j<2; $j++){
            if($j==0)
                $file3[] = explode("\n", $file2[$i][$j]);
            else
                $file4[] = explode("||", $file2[$i][$j]);
        }
    }
    for($i=0; $i<10; $i++){
        for($j=0; $j<10; $j++)
            $file5[] = explode("\n", $file4[$i][$j]);
    }
    for($i=0; $i<10; $i++){
        for($j=0; $j<10; $j++){
            if($i==0){
                $name[]=$file3[$i][$j+1];
                $rating[]=$file3[$i][$j+11];
                $neighborhood[]=$file3[$i][$j+21];
                $address[]=$file3[$i][$j+31];
            }
            else{
                $name[]=$file3[$i][$j+2];
                $rating[]=$file3[$i][$j+12];
                $neighborhood[]=$file3[$i][$j+22];
                $address[]=$file3[$i][$j+32];
            }
        }
    }
    for($i=0; $i<100; $i++){
        for($j=(count($file5[$i])-2); $j>(count($file5[$i])/2); $j--)
            $link[$i][]=$file5[$i][$j];
        for($k=(count($file5[$i])/2); $k>2; $k--)
            $title[$i][]=$file5[$i][$k];
        $latitude[$i][]=$file5[$i][2];
        $longitude[$i][]=$file5[$i][1];
    }

    $remove_space=function($file) {
        return preg_replace("/\s\s+/", "", $file);
    };
    $name = array_map($remove_space, $name);
    $rating = array_map($remove_space, $rating);
    $neighborhood = array_map($remove_space, $neighborhood);
    $address = array_map($remove_space, $address);
    
$dbhost = "Scotts-MacBook-Air.local";
$dbname = "adv_os";
$dbuser = "advos";
$dbpass = "advos";

$conn = new PDO("mysql:host=$dbhost;dbname=$dbname;port=8889",$dbuser,$dbpass);

    $conn->prepare("SET NAMES UTF8")->execute();
    
$sql = "INSERT INTO restaurant (id, name,rating,neighborhood,address,longitude,latitude) VALUES (:id, :name,:rating,:neighborhood,:address,:longitude,:latitude)";
$q = $conn->prepare($sql);
for($k = 0; $k < 100; $k++) {
    $q->execute(array(':id'=>$k,':name'=>$name[$k],':rating'=>$rating[$k],':neighborhood'=>$neighborhood[$k],':address'=>$address[$k],':longitude'=>$longitude[$k][0],':latitude'=>$latitude[$k][0]));
}


$sql2 = "INSERT INTO food_image (restaurant_id,title,link) VALUES (:restaurant_id,:title,:link)";
$p = $conn->prepare($sql2);
for($r = 0; $r < 100; $r++) {
    for($s = (count($title[$r])-1); $s > -1; $s--) {
        $p->execute(array(':restaurant_id'=>$r,':title'=>$title[$r][$s],':link'=>$link[$r][$s]));
    }
}

?>