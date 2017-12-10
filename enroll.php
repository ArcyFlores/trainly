<?php

    /*Informatino to connect to database*/
    session_start();
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "Trainly";
    /*connects to database*/
    $conn = mysqli_connect($servername, $username, $password, $dbname);

    /*Checks if user clicks on enroll button */
    if (isset($_POST['enroll_btn']))
    {
        /*Sets cid to user inputted CourseId */
        $cid = mysql_real_escape_string($_POST['course']);

        /*Get current users studentID */ 
        $email = $_SESSION['email'];
        $idsql = "SELECT s.StudentID FROM Student s WHERE s.Email = '$email'";
        $result2 = mysqli_query($conn, $idsql);
        $row = mysqli_fetch_assoc($result2);
        $id = ($row['StudentID']);
        $conf_code = "ABS192";
        
        /*Sets the format for date and time*/
        $date = date('d-m-Y');
        $time = date('H:i:s');

        
        /*Create an array and append all the courses availble to it*/
        $courseids = array();
        
        $listcoursesql = "SELECT CourseID FROM enroll_in WHERE StudentID = '$id'";
        $listcourseresult = mysqli_query($conn, $listcoursesql);
    
        while ($courselistrow = mysqli_fetch_assoc($listcourseresult))
        {
            array_push($courseids, $courselistrow['CourseID']);
        }
        
        /*Checks if user is already enrolled in the selected course*/
        $count = 0;
        for ($x=0; $x <sizeof($courseids); $x++)
        {
            /*If already enrolled, display error message */
            if ($cid == $courseids[$x])
            {
                echo "You are already enrolled in the selected course";
                $count++;
            }
        }
        
        /*checks is user isnt enrolled, then enrolls student to selected course*/
        if ($count == 0)
        {
            $sql = "INSERT INTO enroll_in (StudentID, CourseID, Conf_Code, Date, Time) VALUES ('$id', '$cid', '$conf_code', '$date' , '$time')";
            $result = mysqli_query($conn, $sql);
            echo "You have been successfully enrolled";
            
            
            
            
            $cmsql = "SELECT cm.CMID AS CMID FROM C_Material cm INNER JOIN Course c ON cm.CourseID = c.CourseID WHERE c.CourseID = '$cid'";
            
            $cmresult = mysqli_query($conn, $cmsql);
            
            $cmid = array();
            
            while ($cmrow = mysqli_fetch_assoc($cmresult))
            {
                array_push($cmid, $cmrow['CMID']);
            }
            
            for ($x = 0; $x < sizeof($cmid); $x++)
            {
                $newcmid = $cmid[$x];
                $insertcmsql = "INSERT INTO CM_Complete (CMID, CourseID, StudentID, cFlag) VALUES ('$newcmid', '$cid', '$id', 0)";
                
                $insertresul = mysqli_query($conn, $insertcmsql);
  
            }
            
        }
        
        /*goes back to home page to display updated information */
        //header("Location: home.php");
    }
?>

<html>
<head>
  <title>Enroll</title>
  <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css" integrity="sha384-nn4HPE8lTHyVtfCBi5yW9d20FjT8BJwUXyWZT9InLYax14RDjBj46LmSztkmNP9w" crossorigin="anonymous">
  <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/grids-responsive-min.css">
  <link rel="stylesheet" type="text/css" href="home.css">
</head>
    <body>
    <div class="header">
        <div class="home-menu pure-menu pure-menu-horizontal pure-menu-fixed">
            <a class="pure-menu-heading" href="index.php">Trainly</a>

            <ul class="pure-menu-list">
                <li class="pure-menu-item pure-menu"><a href="home.php" class="pure-menu-link">Home</a></li>
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
        <h3 class="content-head">List of Courses Available</h4>
        <div class="content">
            <?php
            /* Gets the list of all available courses created to choose from */
            $listcoursesql = "SELECT CourseID, Name FROM Course";
            $listcourseresult = mysqli_query($conn, $listcoursesql);
        
            while ($courselistrow = mysqli_fetch_assoc($listcourseresult))
            {
                echo $courselistrow['CourseID'] . "  " . $courselistrow['Name']."<br>";
            }
        
            ?>
        </div>

            <form class="pure-form" method = POST action ="enroll.php">
                <input type="text" name ="course" placeholder= "Course ID">
                <input class="pure-button pure-button-primary" type="submit" name= "enroll_btn" value = "Enroll">
            </form>
        
    </div>
    </body>
</html>
