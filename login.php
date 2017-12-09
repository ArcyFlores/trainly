<?php
    session_start();
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "Trainly";

    $conn = mysqli_connect($servername, $username, $password, $dbname);

    if (isset($_POST['login_btn']))
    {
        $email = mysql_real_escape_string($_POST['email']);
        $pass = mysql_real_escape_string($_POST['pass']);
        $idsql = "SELECT s.StudentID FROM Student s WHERE s.Email = '$email'";
        $result2 = mysqli_query($conn, $idsql);
                 
                //get StudentID 
        $row = mysqli_fetch_assoc($result2);
        $id = ($row['StudentID']);
            
        
        #$pass = md5($pass); 
        #$pass = password_hash($pass,PASSWORD_DEFAULT);  #password_hash() will generate a random number used as salt and saved under password column in database
        #echo "<script>alert(\"" .$pass. "\")</script>"; This is a test for hashing with salt
        


        $sql = "SELECT * FROM Student WHERE Email = '$email'";
        
        $result= mysqli_query($conn, $sql);
        
        if(mysqli_num_rows($result) == 1)
        {
            $result_row = mysqli_fetch_assoc($result);

            $pass_hash = $result_row['Password'];  

            if (password_verify($pass, $pass_hash))
            {
                $_SESSION['message'] = "You are now logged in";
                $_SESSION['email'] = $email;
                $_SESSION['StudentID'] = $id;
                
                $fsql = "SELECT StudentID FROM Faculty WHERE StudentID = '$id'";
                $fresult = mysqli_query($conn, $fsql);
                
                $asql = "SELECT StudentID FROM Admin WHERE StudentID = '$id'";
                $aresult = mysqli_query($conn, $asql);
                
                if (mysqli_num_rows($aresult) == 1)
                {
                    header("Location: adminhome.php");
                }
                else if (mysqli_num_rows($fresult) == 1)
                {
                    header("Location: homefaculty.php");
                }
                else
                {
                    header("Location: home.php");
                }
            
            }

            else
            {
                echo "Password is incorrect";
                $_SESSION['message'] = "Password is incorrect";
            }
        }

        else
        {
            echo "Username is incorrect";
            $_SESSION['message'] = "Username is incorrect";
        }
    }


?>

<html>
    <head>
        <title>Log In</title>
        <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css" integrity="sha384-nn4HPE8lTHyVtfCBi5yW9d20FjT8BJwUXyWZT9InLYax14RDjBj46LmSztkmNP9w" crossorigin="anonymous">

        <link rel="stylesheet" href="home.css" type="text/css" media="screen">
    </head>
    <body> 
    <div class="header">
        <div class="home-menu pure-menu pure-menu-horizontal pure-menu-fixed">
            <a class="pure-menu-heading" href="index.php">Trainly</a>

            <ul class="pure-menu-list">
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
            <form class="pure-form pure-form-stacked" method="POST" action="login.php">
            <fieldset>
                <legend class="font-lg">Log In</legend>
                <div class="pure-g">
                <div class="pure-u-1 pure-u-md-1-3">
                <label>Email</label>
                <input type="email" name ="email" required>
                <label>Password</label>
                <input type="password" name ="pass">
                <button type="submit" class="pure-button pure-button-primary" id="logIn" name= "login_btn">Log in</button>
            </fieldset>     
        </form>      
    </div>
    <div class="footer"></div>
    </body>
</html>
