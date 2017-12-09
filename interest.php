<?php
    session_start();
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "Trainly";

    $conn = mysqli_connect($servername, $username, $password, $dbname);
    /* Checks if the user clicked on the enroll button*/
    if (isset($_POST['enroll_btn']))
    {
        /* Sets cid to the course id selected by user*/
        $cid = mysql_real_escape_string($_POST['course']);
    
        /*Gets current session studentID */
        $email = $_SESSION['email'];
        $idsql = "SELECT s.StudentID FROM Student s WHERE s.Email = '$email'";
        $result2 = mysqli_query($conn, $idsql);
              
        $row = mysqli_fetch_assoc($result2);
        $id = ($row['StudentID']);
        
        /*Creates an array to append all course ids that user is already interested in */
        $courseids = array();
        $listcoursesql = "SELECT CourseID FROM Enroll_in WHERE StudentID = '$id'";
        $listcourseresult = mysqli_query($conn, $listcoursesql);
        while ($courselistrow = mysqli_fetch_assoc($listcourseresult))
        {
            array_push($courseids, $courselistrow['CourseID']);
        }
        
        /*Checks is user is already enrolled in selected course id*/
        $count = 0;
        for ($x=0; $x <sizeof($courseids); $x++)
        {
            /*If user is already enrolled, display error message*/
            if ($cid == $courseids[$x])
            {
                echo "You are already interested in this course";
                $count++;
            }
        }
        /* If user is not already interested, set as an interest for student sql */
        if ($count == 0)
        {
            $sql = "INSERT INTO Interest (StudentID, CourseID) VALUES ('$id', '$cid')";
            $result = mysqli_query($conn, $sql);
            echo "Your interest has been noted";
        }
        
        /*After enroll, back to home page to view updated courses list*/
        header("Location: home.php");
    }
?>

<html>
<head>
     <title>Interest</title>
        <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css" integrity="sha384-nn4HPE8lTHyVtfCBi5yW9d20FjT8BJwUXyWZT9InLYax14RDjBj46LmSztkmNP9w" crossorigin="anonymous">
        <link rel="stylesheet" href="home.css" type="text/css" media="screen">
</head>
    <body>

    <div class="header">
        <div class="home-menu pure-menu pure-menu-horizontal pure-menu-fixed">
            <a class="pure-menu-heading" href="index.php">Trainly</a>

            <ul class="pure-menu-list">
                <li class="pure-menu-item pure-menu"><a href="home.php" class="pure-menu-link">Home</a></li>
            </ul>
        </div>
    </div>
    <div class="container-padding">
        
        <h4>List of Courses Available</h4>
        <?php
        
        /*Lists all the courses that have been created already in the database for user selection*/
        $listcoursesql = "SELECT CourseID, Name FROM Course";
        $listcourseresult = mysqli_query($conn, $listcoursesql);
        while ($courselistrow = mysqli_fetch_assoc($listcourseresult))
        {
            echo $courselistrow['CourseID'] . "  " . $courselistrow['Name'] . "<br>";
        }
    
        ?>
        <form class="pure-form" method = POST action ="interest.php">
        <input type="text" name ="course" placeholder= "Course ID">
        <input type="submit" class="pure-button" name= "enroll_btn" value = "I am Interested">
        </form>
    </div>
    </body>
</html>
