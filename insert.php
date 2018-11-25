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
$address = mysqli_real_escape_string($link, $_REQUEST['address']);
$contact_no = mysqli_real_escape_string($link, $_REQUEST['contact_no']);
$blood_type = mysqli_real_escape_string($link, $_REQUEST['blood_type']);

if(isset($_POST['add'])) {
// Attempt insert query execution
    $sql = "INSERT INTO donor (name, email, address, contact_no, blood_type) VALUES ('$name', '$email', '$address', '$contact_no', '$blood_type')";
    if(mysqli_query($link, $sql)){
        echo "Records added successfully.";
    } else{
        echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
    }
}

if(isset($_POST['delete'])) {
    $sql = "DELETE FROM donor WHERE email = '$email'";    
    if(mysqli_query($link, $sql)){
        echo "Records deleted successfully.";
    } else{
        echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
    }
}
// Close connection
mysqli_close($link);
?>
