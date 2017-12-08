
<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "Trainly";

    $conn = mysqli_connect($servername, $username, $password, $dbname);

    if (isset($_POST['register_btn']))
    {
        session_start();
        $first = mysql_real_escape_string($_POST['first']);
        $last = mysql_real_escape_string($_POST['last']);
        $email = mysql_real_escape_string($_POST['email']);
        $pass = mysql_real_escape_string($_POST['pass']);
        $pass2 = mysql_real_escape_string($_POST['pass2']);
        $street = mysql_real_escape_string($_POST['street']);
        $city = mysql_real_escape_string($_POST['city']);
        $country = mysql_real_escape_string($_POST['country']);
        $zip = mysql_real_escape_string($_POST['zip']);
        $title = mysql_real_escape_string($_POST['title']);
        $affl = mysql_real_escape_string($_POST['affl']);
        $web = mysql_real_escape_string($_POST['web']);
        
        
        if(isset($_POST['faculty']))
        {
            
            if ($pass == $pass2)
            {
            #$pass = md5($pass); 
            $pass = password_hash($pass,PASSWORD_DEFAULT);  #password_hash() will generate a random number used as salt and saved under password column in database
        
            

            $sql = "INSERT INTO Student (Email, Password, Student_pic, F_Name, L_Name, Street, City, Country, ZipCode) VALUES ('$email', '$pass', '$pic', '$first', '$last' , '$street' , '$city' , '$country' , '$zip')";
            
            $result = mysqli_query($conn, $sql);
            
            
            $_SESSION['message'] = "You are now logged in";
            $_SESSION['email'] = $email;
            $_SESSION['first'] = $first;
            $_SESSION['last'] = $last;
            $_SESSION['street'] = $street;
            $_SESSION['city'] = $city;
            $_SESSION['country'] = $country;
            $_SESSION['zip'] = $zip;
            
            
            $idsql = "SELECT s.StudentID FROM Student s WHERE s.Email = '$email'";
            $result2 = mysqli_query($conn, $idsql);
                 
            //get StudentID 
            $row = mysqli_fetch_assoc($result2);
            $id = ($row['StudentID']);
            
            
            $_SESSION['StudentID'] = $id;
                        
            //Add user to faculty table
            $sql1 = "INSERT INTO Faculty (StudentID, Title, Affiliation, Work_Website) VALUES ('$id', '$title', '$affl' , '$web')";
            mysqli_query($conn, $sql1);
                
            header("Location: homefaculty.php");
            
            }
        }
        else
        {
            if ($pass == $pass2)
            {
            $pass = password_hash($pass,PASSWORD_DEFAULT);  #password_hash() will generate a random number used as salt and saved under password column in database
            $sql = "INSERT INTO Student (Email, Password, Student_pic, F_Name, L_Name, Street, City, Country, ZipCode) VALUES ('$email', '$pass', '$pic', '$first', '$last' , '$street' , '$city' , '$country' , '$zip')";
            
            $result = mysqli_query($conn, $sql);
            
            
            $_SESSION['message'] = "You are now logged in";
            $_SESSION['email'] = $email;
            $_SESSION['first'] = $first;
            $_SESSION['last'] = $last;
            $_SESSION['street'] = $street;
            $_SESSION['city'] = $city;
            $_SESSION['country'] = $country;
            $_SESSION['zip'] = $zip;
            
            
            $idsql = "SELECT s.StudentID FROM Student s WHERE s.Email = '$email'";
                $result2 = mysqli_query($conn, $idsql);
                 
                //get StudentID 
                $row = mysqli_fetch_assoc($result2);
                $id = ($row['StudentID']);
            
            
            $_SESSION['StudentID'] = $id;
            
            
            header("Location: home.php");
            }
            else
            {
            $_SESSION['message'] = "The two passwords do not match";
            }
        }
    
    }


?>

<html>
    <head>
        <title>Sign Up</title>
         <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css">
        <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/grids-responsive-min.css">
        <link rel="stylesheet" type="text/css" href="home.css">
    </head>
    <body>

    <div class="header">
        <div class="home-menu pure-menu pure-menu-horizontal pure-menu-fixed">
            <a class="pure-menu-heading" href="index.php">Trainly</a>
            <ul class="pure-menu-list">
                <li class="pure-menu-item pure-menu"><a href="login.php" class="pure-menu-link">Log In</a></li>
                <li class="pure-menu-item pure-menu-has-children pure-menu-allow-hover">
                <a href="#" id="menuLink1" class="pure-menu-link">Reports</a>
                <ul class="pure-menu-children">
                    <li class="pure-menu-item"><a href="ReportTask1.php" class="pure-menu-link">Faculty</a></li>
                    <li class="pure-menu-item"><a href="ReportTask2.php" class="pure-menu-link">B Grade</a></li>
                    <li class="pure-menu-item"><a href="ReportTask3.php" class="pure-menu-link">Quizzes</a></li>
                    <li class="pure-menu-item"><a href="ReportTask4.php" class="pure-menu-link">Incomplete</a></li>
                    <li class="pure-menu-item"><a href="ReportTask5.php" class="pure-menu-link">Questions</a></li>
                </ul>
                </li>
            </ul>
    
        </div>
    </div>

<div class="container-padding">
     <form class="pure-form pure-form-stacked" method = "POST" action = "register.php">
        <fieldset>
            <legend class="font-lg">Sign Up</legend>
            <div class="pure-g">
                <div class="pure-u-1 pure-u-md-1-3">
                    <label>First Name</label>
                    <input type="text" name ="first" required>
                </div>
                <div class="pure-u-1 pure-u-md-1-3">
                    <label>Last Name</label>
                    <input type="text" name ="last" required>
                </div>
                <div class="pure-u-1 pure-u-md-1-3">
                    <label>Email</label>
                    <input type="email" name ="email" required>
                </div>
                <div class="pure-u-1 pure-u-md-1-3">
                    <label>Password</label>
                    <input type="password" name ="pass" required>
                </div>
                <div class="pure-u-1 pure-u-md-1-3">
                    <label>Confirm Password</label>
                    <input type="password" name ="pass2" required>
                </div>
                <div class="pure-u-1 pure-u-md-1-3">
                    <label>Street Address</label>
                    <input type="text" name ="street" required>
                </div>
                <div class="pure-u-1 pure-u-md-1-3">
                    <label>City</label>
                    <input type="text" name ="city" required>
                </div>
                <div class="pure-u-1 pure-u-md-1-3">
                    <label>Country</label>
                    <input type="text" name ="country" required>
                </div>
                <div class="pure-u-1 pure-u-md-1-3">
                    <label>Zip Code</label>
                    <input type="text" name ="zip" required>
                </div>
            </div>
            <div class="pure-u-1 pure-u-md-1-3">  
                <input type ="checkbox" name ="student" value ="student">Student
                <input type ="checkbox" name ="faculty" value ="faculty">Faculty
            </div>
            <div class="pure-u-1 pure-u-md-1-3">
                <div id ="hidden_fields">
                    <label>Title</label>
                    <input type="text" name ="title">
                    <label>Affiliation</label>
                    <input type="text" name ="affl">
                    <label>Website</label>
                    <input type="text" name ="web">
                </div>
            </div>
               <button type="submit" class="pure-button pure-button-primary" id="registerBtn" name="register_btn">Sign Up</button>

        </fieldset>
    </form>

</div>

<div class="footer"></div>
   
    </body>
</html>