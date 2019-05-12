<!--
TP6 Solution
08.04.2019

Creating a website in one PHP file, which receives ten parameters 
from the user and save them in the database, if there is 
no match has been found already.

Mohammad Parhizkar 
-->

<!DOCTYPE HTML>  
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<body>  

<?php
// define variables and set to empty values
$first_nameErr = $last_nameErr = $emailErr = $phoneErr = $hireDateErr = $job_idErr = $salaryErr = $comErr = $managerIDErr = $departementIDErr = "";
$first_name = $last_name = $email = $phone = $hireDate = $job_id = $salary = $com = $managerID = $departementID = "";

//———————————Generate unique ID------------------------
//$employee_id=uniqid ( $prefix = "employee_" );
//set the random id length
$emp_id_length = 4;
//generate a random id encrypt it and store it
$emp_id = crypt(uniqid(rand(),1));
//to remove any slashes that might have come
$emp_id = strip_tags(stripslashes($emp_id));
//Removing any . or / and reversing the string
$emp_id = str_replace(".","",$emp_id);
$emp_id = strrev(str_replace("/","",$emp_id));
//finally I take the first 3 characters from the $rnd_id
$emp_id = substr($emp_id,0,$emp_id_length);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  if (empty($_POST["first_name"])) {
    $first_nameErr = "First Name is required";
  } else {
    $first_name = test_input($_POST["first_name"]);
    // check if name only contains letters and whitespace
    if (!preg_match("/^[a-zA-Z ]*$/",$first_name)) {
      $first_nameErr = "Only letters and white space allowed"; 
    }
  }
  
  if (empty($_POST["last_name"])) {
    $last_nameErr = "Last Name is required";
  } else {
    $last_name = test_input($_POST["last_name"]);
    // check if name only contains letters and whitespace
    if (!preg_match("/^[a-zA-Z ]*$/",$last_name)) {
      $last_nameErr = "Only letters and white space allowed"; 
    }
  }
  
  
  if (empty($_POST["email"])) {
    $emailErr = "Email is required";
  } else {
    $email = test_input($_POST["email"]);
    // check if e-mail address is well-formed
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
      $emailErr = "Invalid email format"; 
    }
  }
  
  if (empty($_POST["phone"])) {
    $phone = "";
  } else {
    $phone = test_input($_POST["phone"]);
	if(!preg_match( '/^[+]?([\d]{0,3})?[\(\.\-\s]?([\d]{3})[\)\.\-\s]*([\d]{3})[\.\-\s]?([\d]{4})$/', $phone ) ) {
      $phoneErr = "Invalid Phone Number format"; 
    }
  }
  
  if (empty($_POST["hireDate"])) { 
	$hireDateErr="Hire date is required.";
  } else { 
	$format = "d/m/Y"; 
	$hireDate = DateTime::createFromFormat($format, $_POST["hireDate"]);
	if(!$hireDate) { // createFromFormat returns false if the format is invalid;
		$hireDateErr = "Invalid date format"; 
	} else { //change it to any format you want with format() (e.g. 2013-08-31)
		$hireDate= $hireDate->format("d/m/Y"); 
	}
  }
  
  $job_id = test_input($_POST["job_id"]);
  
  
  if (empty($_POST["salary"])) {
    $salary = "";
  } else {
    $salary = test_input($_POST["salary"]);
	if($salary < 2000 or 5000 < $salary ) {
      $salaryErr = "The salary must be between 2000 and 5000"; 
    }
  }
  
  if (empty($_POST["com"])) {
    $com = "";
  } else {
    $com = test_input($_POST["com"]);
	if($com < 0 or 1 < $com ) {
      $comErr = "The commission percentage must be between 0 and 1"; 
    }
  }
    
  if (empty($_POST["managerID"])) {
    $managerIDErr = "Manager ID is required";
  } else {
    $managerID = test_input($_POST["managerID"]);
    // check if name only contains letters and whitespace
    if ($managerID < 100 or 1000 <=	$managerID) {
      $managerIDErr = "Manager ID must be a 3 digit number"; 
    }
  }
  
  if (empty($_POST["departementID"])) {
    $departementIDErr = "Departement ID is required";
  } else {
    $departementID = test_input($_POST["departementID"]);
    // check if name only contains letters and whitespace
    if ($departementID < 10 or 1000 <=	$departementID) {
      $departementIDErr = "Departement ID must be a 2 or 3 digit number"; 
    }
  }
  
  $servername = "localhost";
  $username = "root";
  $password = "";
  $dbname = "HR";

  if ($first_nameErr == "" and $last_nameErr == "" and $emailErr == "" and $phoneErr == "" and $hireDateErr == "" and $job_idErr == "" and $salaryErr == "" and $comErr == "" and  $managerIDErr == "" and $departementIDErr == ""){            
	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	// Check connection
	if ($conn->connect_error){
      die("Connection failed:" . $conn->connect_error);
	}
	if ($phone == ""){$phoneSQL = "NULL";}else{$phoneSQL = "'" . $phone . "'";}
	if ($salary == ""){$salarySQL = "NULL";}else{$slarySQL = "'" . $salary . "'";}
	if ($com == ""){$comSQL = "NULL";}else{$comSQL = "'" . $com . "'";}
	$sql = "INSERT INTO employees VALUES ( '" . $emp_id . "', '" . $first_name . "', '" . $last_name . "', " . $phoneSQL . ", '" . $hireDate . "', '" . $job_id . "', " . $salarySQL . ", " . $comSQL . " , '" . $managerID . "', '" . $departementID . "');";
	$result = $conn->query($sql);
	echo "result :" . $result;
	echo "<br>";
  }
  
}



function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>

<h2>Session 6: PHP Form Validation </h2>
<p><span class="error">* required field.</span></p>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
  First Name: <input type="text" name="first_name" value="<?php echo $first_name;?>">
  <span class="error">* <?php echo $first_nameErr;?></span>
  <br><br>
  Last Name: <input type="text" name="last_name" value="<?php echo $last_name;?>">
  <span class="error">* <?php echo $last_nameErr;?></span>
  <br><br>
  E-mail: <input type="text" name="email" value="<?php echo $email;?>">
  <span class="error">* <?php echo $emailErr;?></span>
  <br><br>
  Phone Number: <input type="text" name="phone" value="<?php echo $phone;?>">
  <span class="error"><?php echo $phoneErr;?></span>
  <br><br>
  Hire Date: <input type="text" name="hireDate" value="<?php echo $hireDate;?>">
  <span class="error">* <?php echo $hireDateErr;?></span>
  <br><br>
  
  <label for="job_id">Select a job id:</label>
	<div class="custom-select" style="width:200px;">
	  <select name="job_id">
		<!--<option value="<?php echo $job_id;?>"</option>-->
		<option value="AD_PRES">AD_PRES</option>
		<option value="AD_VP">AD_VP</option>
		<option value="IT_PROG">IT_PROG</option>
		<option value="FI_MGR">FI_MGR</option>
		<option value="FI_ACCOUNT">FI_ACCOUNT</option>
		<option value="PU_MAN">PU_MAN</option>
		<option value="PU_CLERK">PU_CLERK</option>
		<option value="ST_MAN">ST_MAN</option>
		<option value="ST_CLERK">ST_CLERK</option>
		<option value="SA_MAN">SA_MAN</option>
		<option value="SA_RAP">SA_RAP</option>
		<option value="SA_REP">SA_REP</option>
	  </select>
	</div>
  <br><br>
  
  Salary: <input type="number" name="salary" value="<?php echo $salary;?>">
  <span class="error"><?php echo $salaryErr;?></span>
  <br><br>
  Commission percentage: <input type="number" step="0.01" name="com" value="<?php echo $com;?>">
  <span class="error"><?php echo $comErr;?></span>
  <br><br>
  Manager ID: <input type="number" name="managerID" value="<?php echo $managerID;?>">
  <span class="error">*<?php echo $managerIDErr;?></span>
  <br><br>
  Departement ID: <input type="number" name="departementID" value="<?php echo $departementID;?>">
  <span class="error">*<?php echo $departementIDErr;?></span>
  <br><br>
  <input type="submit" name="submit" value="Submit">  
</form>

<?php
echo "<h2>Your Input:</h2>";
echo "Employee ID: ", $emp_id;
echo "<br>";
echo "First Name: ", $first_name;
echo "<br>";
echo "Last Name: ", $last_name;
echo "<br>";
echo "Email: ", $email;
echo "<br>";
echo "Phone number: ", $phone;
echo "<br>";
echo "hireDate: ", $hireDate;
echo "<br>";
echo "Job ID: ", $job_id;
echo "<br>";
echo "Salary: ", $salary;
echo "<br>";
echo "Commission Percentage: ", $com;
echo "<br>";
echo "Manager ID: ", $managerID;
echo "<br>";
echo "Departement ID: ", $departementID;
echo "<br>";
?>

</body>
</html>