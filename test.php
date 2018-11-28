<form method="post">
    <input type="submit" name="donor" id="test" value="RUN" /><br/>
</form>
<?php
function show_db() {
 $link = mysqli_connect("localhost", "administrator","very_strong_password", "blood_donation");


/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}
$query = "SELECT * FROM donor";

if ($result = mysqli_query($link, $query)) {

    /* fetch associative array */
    while ($row = mysqli_fetch_row($result)) {
        echo implode("-",$row);
        echo "<br>";
    }

    /* free result set */
    mysqli_free_result($result);
}
}
/* close connection */
mysqli_close($link);
if(array_key_exists('donor',$_POST)){
   show_db();
}
?>
