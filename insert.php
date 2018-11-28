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
$contact_no = mysqli_real_escape_string($link, $_REQUEST['contact_no']);
$blood_type = mysqli_real_escape_string($link, $_REQUEST['blood_type']);
$nurse_id = mysqli_real_escape_string($link, $_REQUEST['nurse_id']);
$doctor_id = mysqli_real_escape_string($link, $_REQUEST['doctor_id']);
$allegies = mysqli_real_escape_string($link, $_REQUEST['allegies']);
//nurse attribute
$donor_email = mysqli_real_escape_string($link, $_REQUEST['donor_email']);

if(isset($_POST['add'])) {
// Attempt insert query execution
    $sql = "INSERT INTO donor (name, email, contact_no, blood_type, fk_nu_id, fk_dr, allegies) VALUES ('$name', '$email', '$contact_no', '$blood_type','$nurse_id', '$doctor_id', '$allegies')";
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
        echo "User does not exist in the database";
    }
}

if(isset($_POST['add_nurse'])) {
// Attempt insert query execution
    $sql = "INSERT INTO nurse (name, id, address, contact_no, donor_email) VALUES ('$name',NULL , '$address', '$contact_no', '$donor_email')";
    if(mysqli_query($link, $sql)){
        echo "Records added successfully.";
    } else{
        echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
    }
}

if(isset($_POST['delete_nurse'])) {
    $sql = "DELETE FROM donor WHERE id = $id";    
    if(mysqli_query($link, $sql)){
        echo "Records deleted successfully.";
    } else{
        echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
    }
}
// Close connection
mysqli_close($link);
?>
