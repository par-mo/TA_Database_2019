
<!-- The switch statement is used to perform
 different actions based on different conditions.-->
<?php
$favrit_car = "BMW";

switch ($favcolor) {
    case "BMW":
        echo "Your favorite car is expensive!";
        break;
    case "VW":
        echo "Your favorite color is cheap!";
        break;
     default:
        echo "Your favorite car is neither expensive, nor cheap!";
}
?>

<!-- PHP While loop -->
<?php 
$my_number = 1; 

while($my_number <= 10) {
    echo "My number: $x <br>";
    $my_number++;
} 
?>

<!-- PHP While loop 2 -->
<?php 
$my_number = 6;

do {
    echo "The number is: $my_number <br>";
    $my_number++;
} while ($my_number<= 5);
?>


<!-- PHP for loop-->
<?php 
for ($my_v = 0; $my_v <= 8; $my_v++) {
    echo "The number is: $my_v <br>";
} 
?>



<!-- PHP Arrays-->
<?php
$colors = array("red", "blue", "green");
echo "I like " . $colors[0] . ", " . $colors[1] . " and " . $colors[2] . ".";
?>



