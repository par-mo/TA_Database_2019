<?php
$servername = "localhost";
			$username = "db_2018";
			$password = "12345";
			$dbname = "Movie_Shop";

			// Create connection
			$conn = new mysqli($servername, $username, $password, $dbname);
			// Check connection
			if ($conn->connect_error) {
			    die("Connection failed: " . $conn->connect_error);
			} 
$sql = "SELECT title,category FROM films WHERE category = 'drama'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo  " - Name: " . $row["title"]. " --- " . $row["category"]. "<br>";
    }
} else {
    echo "0 results";
}
$conn->close();
?>