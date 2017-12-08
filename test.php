<?php

include 'registertest.php' ;

?>

<html>
    <head>
        <title>Sign Up</title>
    </head>
    <body>        
    <form method = "POST" action = "registertest.php">
    <label>First Name</label>
        <input type="text" name ="first" required><br>
    <label>Last Name</label>
        <input type="text" name ="last" required><br>
    <label>Email</label>
        <input type="email" name ="email" required><br>
    <label>Password</label>
        <input type="password" name ="pass" required><br>
        <label>Confirm Password</label>
        <input type="password" name ="pass2" required><br>
    <label>Street Address</label>
        <input type="text" name ="street" required><br>
    <label>City</label>
        <input type="text" name ="city" required><br>
    <label>Country</label>
        <input type="text" name ="country" required><br>
    <label>Zip Code</label>
        <input type="text" name ="zip" required><br>
        
        <input type ="checkbox" name ="student" value ="student">Student
        <input type ="checkbox" name ="faculty" value ="faculty">Faculty
        <input type ="checkbox" name ="admin" value ="admin">Admin
        <div id ="hidden_fields">
            <label>Title</label>
            <input type="text" name ="title"><br>
            <label>Affiliation</label>
            <input type="text" name ="affl"><br>
            <label>Website</label>
            <input type="text" name ="web"><br>
        </div>
       <input type="submit" name= "register_btn" value = "Sign Up">
        
    </form>
    </body>
</html>