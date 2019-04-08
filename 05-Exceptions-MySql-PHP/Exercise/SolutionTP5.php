<!-- 
TP5 Solution
 M. Parhizkar
08/04/2019
 -->
<html>

	<head>
		<title>Solution</title>
	</head>
	
	<body>
		
				
	Question <?php  $servername = "localhost";
			$username = "db_2019";
			$password = "12345";
			$dbname = "Movie_Shop";

			// Create connection
			$conn = new mysqli($servername, $username, $password, $dbname);
			// Check connection
			if ($conn->connect_error) {
			    die("Connection failed: " . $conn->connect_error);
			} 
	
switch ($_POST["question_number"]) {
//-------------------
     case "1":
        echo " 1:".  "<br>";
		$sql1 = "SELECT director_last_name FROM directors WHERE country = 'Canada'";
		$result1 = $conn->query($sql1);

		if ($result1->num_rows > 0) {
   			 // output data of each row
    		while($row = $result1->fetch_assoc()) {
      		  echo   " -Director's name: " . $row["director_last_name"].  "<br>";
  			  }
			} else {
 			   echo "0 results";
			}  
      break; 
//-------------------
    case "2":
        echo " 2:"."<br>";
        $sql = "SELECT title FROM films WHERE category = 'drama'";
		$result = $conn->query($sql);

		if ($result->num_rows > 0) {
  		  // output data of each row
   		 while($row = $result->fetch_assoc()) {
        echo  " -Movie: ". $row["title"]. "<br>";
   		 }
			} else {
   			 echo "0 results";
   			 }
        break;
//-------------------
    case "3":
        echo " 3:"."<br>";
        $sql = "SELECT language, category FROM films WHERE  Year(Year)>'2000'";
		$result = $conn->query($sql);

		if ($result->num_rows > 0) {
  		  // output data of each row
   		 while($row = $result->fetch_assoc()) {
        echo   $row["language"]. "--".$row["category"]. "<br>";
   		 }
			} else {
   			 echo "0 results";
   			 }
        break;
//-------------------
    case "4":
        echo " 4:"."<br>";
        $sql = "SELECT first_name, last_name FROM main_actors WHERE  Year(birthday)>'1950'";
		$result = $conn->query($sql);

		if ($result->num_rows > 0) {
  		  // output data of each row
   		 while($row = $result->fetch_assoc()) {
        echo   $row["first_name"]. "--".$row["last_name"]. "<br>";
   		 }
			} else {
   			 echo "0 results";
   			 }
        break;
//-------------------
    case "5":
        echo " 5:"."<br>";
            $sql = "SELECT directors.DIRECTOR_LAST_NAME, FILMs.title 
            FROM DIRECTORs JOIN FILMs   ON FILMs.DIRECTOR_ID = DIRECTORs.DIRECTOR_ID 
            ORDER BY directors.DIRECTOR_LAST_NAME";
		$result = $conn->query($sql);

		if ($result->num_rows > 0) {
  		  // output data of each row
   		 while($row = $result->fetch_assoc()) {
        echo   $row["DIRECTOR_LAST_NAME"]. "--" ;
        echo    $row["title"]. "<br>";

   		 }
			} else {
   			 echo "0 results";
   			 }
        break;            
}

?>




		
	</body>
	
</html>


