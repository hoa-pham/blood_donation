<?php
/* Attempt MySQL server connection. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
$link = mysqli_connect("localhost", "administrator", "very_strong_password", "blood_donation");
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
 
// Escape user inputs for security
$name = mysqli_real_escape_string($link, $_REQUEST['name']);
$email = mysqli_real_escape_string($link, $_REQUEST['email']);

if(isset($_POST['add'])) {
// Attempt insert query execution
    $sql = "INSERT INTO donor (name, email) VALUES ('$name', '$email')";
    if(mysqli_query($link, $sql)){
        echo "Records added successfully.";
    } else{
        echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
    }
}

if(isset($_POST['delete'])) {
    $sql = "DELETE FROM donor WHERE name = '$name'";    
    if(mysqli_query($link, $sql)){
        echo "Records deleted successfully.";
    } else{
        echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
    }
}
// Close connection
mysqli_close($link);
?>
