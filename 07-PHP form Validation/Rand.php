//------------------------Generate unique ID------------------------
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