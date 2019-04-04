<!--  PHP_function1.php -->
<html>
<body>

<?php
$my_variable1 = 15; // global scope
 
function func_1() {
    // using x inside this function will generate an error
    echo "<p>1. Variable my_variable1 inside function is: $my_variable1</p>";
} 
func_1();

echo "<p>2. Variable my_variable1 outside function is: $my_variable1</p>";
?>

</body>
</html>




<!-- global variable -- >
<!--  PHP_function2.php -->
<html>
<body>

<?php
$my_variable2 = 15; // global scope
 
function func_2() {
	global $my_variable2;
    // using x inside this function will generate an error
    echo "<p>1. Variable my_variable2 inside function is: $my_variable2</p>";
} 
func_2();

echo "<p>2. Variable my_variable2 outside function is: $my_variable2</p>";
?>

</body>
</html>

