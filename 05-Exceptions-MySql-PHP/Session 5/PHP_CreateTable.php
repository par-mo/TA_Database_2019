<html>
   <head>
      <title>Creating MySQL Tables</title>
   </head>
   <body>
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

			// sql to create table
			$sql = "CREATE TABLE CUSTOMERS (
			id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
			firstname VARCHAR(30) NOT NULL,
			lastname VARCHAR(30) NOT NULL,
			email VARCHAR(50),
			reg_date TIMESTAMP
			)";

			if ($conn->query($sql) === TRUE) {
			    echo "Table CUSTOMERS created successfully";
			} else {
 			   echo "Error creating table: " . $conn->error;
}

$conn->close();
?>
   </body>
</html>


