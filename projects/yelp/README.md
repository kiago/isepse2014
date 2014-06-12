advos
=====

<br />

Please check here for the commit : https://github.com/ben-nsng/advos

<br />

<p>Introduction of Our Project</p>
<div>
In this project, we are trying to build a web app that allows users to get known of 100 restaurants with the highest rating in Paris. Also, our app would display the arrondissement with restaurants having the highest rating and also shows them on map. The app contains the information of restaurants inculding their names, addresses, ratings and also the photos of food that is decilious there. With this app, we hope that people would not need to waste time searching famous restaruants or even have to try so many bad restaurants before they reach a good one.
</div>

<br />

<p>Data Extraction from YELP</p>
<div>
First of all, we need to get the data from yelp. There is a bash script inside extraction folder, execute yelp.sh will download 10 pages data of restaurant from yelp, including the 100 restaurants with the highest rating. Then the script will parse the html file and save the restaurant name, rating and address into extraction/result file. After downloading 10 pages, the script will further download images link and caption for each restaurant. In total there will be thousands of images link storing in the extraction/result file.
</div>

<br />

<p>Importing Data to Database</p>
<div>
After downloading the data from YELP, the importing of data to MySQL database is done by PHP. First, the result extraction/result fie is onverted to .txt file and then it is imported into a variable called $file. By using the function explode(), we manage to split the file into two major parts with the help of delimiter %% and ||, one contains the name, rating, neighborhood and address of restaurants and the other one contains the coordinates and also image links with caption of delicious food for each restaurants. Then the data are put into dfferent arrays line by line in order to import them into database. After connecting to database, we just need to use INSERT INTO to put the arrays into database. The data in the database are divided into two groups, one with the id and other information of restaurants and the other one is the image links sorted by the id of restaurants. the file osa.php is the code for splitting the data and putting them into database.
</div>

<br />

<p>GUI Interface</p>
<div>
GUI interface is written using PHP. The pages will show you which restaurants are in database and you can view more details, let say food images of a restaurant by clicking "view button" for each restaurant. The main page is index.php.
<br />
You can access the index page by this link: http://adv-os.elp-spot.net/
</div>

<br />

<p>Detail of Restaurants</p>
<div>
You can view the detail of each restaurant, such as the map location, and all the food images. Here is an example of the detail view: http://adv-os.elp-spot.net/restaurant.php?id=0
</div>

<br />

<p>Result to Show Arrondissement with Restaurants with the Highest Rating</p>
<div>
The php script calculates which arrondissement the restaurants with the highest rating are located in. After the calculation, it will show all the restaurants in the google map with markers. And the list of the restaurants will be shown below the map. You can click detail view of each of restaurant. You can access this page: http://adv-os.elp-spot.net/summary.php
</div>
