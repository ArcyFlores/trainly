<?php
// connect to db
    session_start();

    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "Trainly";

    $conn = mysqli_connect($servername, $username, $password, $dbname);
?>

<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css" integrity="sha384-nn4HPE8lTHyVtfCBi5yW9d20FjT8BJwUXyWZT9InLYax14RDjBj46LmSztkmNP9w" crossorigin="anonymous">

    <!-- <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/grids-responsive-min.css"> -->

    <link rel="stylesheet" href="home.css">
</head>
        
<body>
<!--  navbar    -->
    <div class="header">
        <div class="home-menu pure-menu pure-menu-horizontal pure-menu-fixed">
            <a class="pure-menu-heading" href="index.php">Trainly</a>

            <ul class="pure-menu-list">
                <li class="pure-menu-item pure-menu"><a href="home.php" class="pure-menu-link">Home</a></li>
                <li class="pure-menu-item"><a href="history.php" class="pure-menu-link">Account History</a></li>
                <li class="pure-menu-item"><a href="index.php" class="pure-menu-link">Log Out</a></li>
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
    <div class="content top-buffer-xl">
          <?php
//     get info from login page to display user's name
        $email = $_SESSION['email'];
        $idsql = "SELECT s.StudentID FROM Student s WHERE s.Email = '$email'";
        $fnamesql = "SELECT s.F_Name FROM Student s WHERE s.Email = '$email'";
        $lnamesql = "SELECT s.L_Name FROM Student s WHERE s.Email = '$email'";
        $result2 = mysqli_query($conn, $idsql);
        $result3 = mysqli_query($conn, $fnamesql);
        $result4 = mysqli_query($conn, $lnamesql);
    
                 
        //get StudentID 
        $row = mysqli_fetch_assoc($result2);
        $row2 = mysqli_fetch_assoc($result3);
        $row3 = mysqli_fetch_assoc($result4);
        $id = ($row['StudentID']);
        $fname = ($row2['F_Name']);
        $lname = ($row3['L_Name']);
//        enroll in a course task     
    $enrollcoursesql = "SELECT * FROM
        (SELECT c.Name AS Course_Name, c.Pri_Topic AS Primary_Topic, st.Topic AS Secondary_Topics, 'Enrolled' AS Category
        FROM ((Student s INNER JOIN Enroll_in e ON s.StudentID = e.StudentID)
       INNER JOIN Course c ON e.CourseID = c.CourseID)
       INNER JOIN Sec_topic st ON c.CourseID = st.CourseID
       WHERE s.StudentID = '$id'
       ORDER BY e.Rating DESC
       LIMIT 100) AS a";
            
    $enrollcourseresult = mysqli_query($conn, $enrollcoursesql);
        
    ?>

    <h2 class="content-head is-center"> Welcome <?php echo $fname . " " . $lname; ?></h2>

    <div class="pure-g">
        <div class="l-box-lg pure-u-1">
            <h4>Student ID#: <?php echo $_SESSION['StudentID']; ?></h4>
        </div>

        <div class="l-box-lg pure-u-1 pure-u-md-1-2 pure-u-lg-1-4">
            <!--ENROLLED COURSES*/-->
            <h3 class="contet-subhead">You are currently enrolled in:</h3>
            <p>
            
            <?php
                    echo "<table class='pure-table pure-table'>
                          <thead>
                          <tr><th>Course Name</th>
                          <th>Primary Topic</th>
                          <th>Secondary Topics</th>
                          <thead>
                          <tbody>";
                    while($enrollcourserow = mysqli_fetch_assoc($enrollcourseresult))
                    {
                    $coursename = $enrollcourserow['Course_Name'];        
                    $pritopic = $enrollcourserow['Primary_Topic'];
                    $sectopic = $enrollcourserow['Secondary_Topics'];
                    echo "<tr><td>".$coursename."</td><td>".$pritopic."</td><td>".$sectopic."</td></tr>";  
                    }

                echo " </tbody></table>";
                
            ?>
        </p>

        <h3>To enroll in more courses, click <a href="enroll.php" class="pure-button">here.</a></h3> 
            
        </div>
        <div class="l-box-lg pure-u-1 pure-u-md-1-2 pure-u-lg-1-4">
        
        <!--INTERESTED COURSES*/-->
        <?php
            $interestcoursesql = "(SELECT c.Name AS Course_Name, c.Pri_Topic AS Primary_Topic, st.Topic AS Secondary_Topics,'Interested' AS Category
            FROM ((Student s INNER JOIN Interest i ON s.StudentID = i.StudentID)
           INNER JOIN Course c ON i.CourseID = c.CourseID)
           INNER JOIN Sec_topic st ON c.CourseID = st.CourseID
            WHERE s.StudentID = '$id')";
        
            $interestcourseresult = mysqli_query($conn, $interestcoursesql);
            
        ?>
        </div>

    <div class="l-box-lg pure-u-1 pure-u-md-1-2 pure-u-lg-1-4">
        
        <h3 class="content-subhead">You are currently interested in:</h3>
        <p>
        <?php
//             dynamically create a table that displays courses a user is intereseted in 
                echo "<table class='pure-table'>
                    <thead>
                        <tr>
                        <th>Course Name</th>
                        <th><b>Primary Topic</th>
                        <th>Secondary Topics</th>
                        </tr>
                    </thead>
                    <tbody>";
                while($interestcourserow = mysqli_fetch_assoc($interestcourseresult))
                {
                    $coursename = $interestcourserow['Course_Name'];        
                    $pritopic = $interestcourserow['Primary_Topic'];
                    $sectopic = $interestcourserow['Secondary_Topics'];
                    echo "<tr><td>".$coursename."</td><td>".$pritopic."</td><td>".$sectopic."</td></tr>";   
                }  

            echo "</tbody></table>";
            
        ?>
            
        </p>

        <h3 class="content-subhead">To add to your course interests, click <a href="interest.php" class="pure-button">here.</a>
    </div>

        
        <!--COMPLETED COURSES*/-->
            <?php
            $compcoursesql = "SELECT c.Name AS Course_Name, c.Pri_Topic AS Primary_Topic, st.Topic AS Secondary_Topics,'Completed' AS Category
        FROM ((Student s INNER JOIN Enroll_in e ON s.StudentID = e.StudentID)
        INNER JOIN Course c ON e.CourseID = c.CourseID)
        INNER JOIN Sec_topic st ON c.CourseID = st.CourseID
        WHERE s.StudentID = '$id' AND e.C_date IS NOT NULL";
        
            $compcourseresult = mysqli_query($conn, $compcoursesql);
            
        ?>

    <div class="l-box-lg pure-u-1 pure-u-md-1-2 pure-u-lg-1-4">
        <h3 class="content-subhead">You have completed:</h3>
        <h4>Certificates</h4>
        <?php
        
            $cert = "SELECT c.Name AS Course_Name, e.C_date AS Completion_Date
            FROM Course c INNER JOIN Enroll_in e ON c.CourseID = e.CourseID
           INNER JOIN Student s ON e.StudentId = s.StudentID
           WHERE e.C_date IS NOT NULL AND s.StudentID = '$id'";
        
            $certresult = mysqli_query($conn, $cert);
    
        // dynamically create a table that displays courses a user has completed  
        echo "<table class='pure-table'>
            <thead>
             <tr>
                <th>Course Name</th>
                <th><b>Completion Date</th>
                </tr>
            </thead>
            <tbody>";
            while($certrow = mysqli_fetch_assoc($certresult))
            {
                $coursename = $certrow['Course_Name'];        
                $compdate = $certrow['Completion_Date'];
                
                "<tr><td>".$coursename."</td><td>".$compdate."</td></tr>"; 
            }
            
        echo "</tbody></table>"; 
        ?>
        <p>

          <?php
// dynamically add table that displays courses 
            echo "<table class='pure-table'>
                 <thead>
                    <tr>
                    <th>Course Name</th>
                    <th>Primary Topic</th>
                    <th>Secondary Topics</th>
                    </tr>
                </thead>
                <tbody>";
            while($compcourserow = mysqli_fetch_assoc($compcourseresult))
            {
                $coursename = $compcourserow['Course_Name'];        
                $pritopic = $compcourserow['Primary_Topic'];
                $sectopic = $compcourserow['Secondary_Topics'];
                echo "<tr><td>".$coursename."</td><td>".$pritopic."</td><td>".$sectopic."</td></tr>"; 

            }
        
        echo "</tbody></table>";
            
        ?>
        </p>
      </div>  
        
    <div class="l-box-lg pure-u-1 pure-u-md-1-2 pure-u-lg-1-4">
        <h3 class="content-subhead">Your Course Materials:</h3>
        <?php 
//     query to get all the course materials for a given student    
        $cmsql = "SELECT cm.Name AS Course_Material, IF(cc.cFlag =1, 'C', 'I') AS Complete_Incomplete
        FROM C_Material cm INNER JOIN Course c ON cm.CourseID = c.CourseID
        INNER JOIN CM_Complete cc ON cm.CMID = cc.CMID
        INNER JOIN Student s ON s.StudentID = cc.StudentID
        WHERE c.CourseID IN 
        (
           SELECT c.CourseID
           FROM Course c INNER JOIN Enroll_in e ON c.CourseID = e.CourseID
            INNER JOIN Student s ON e.StudentID = s.StudentID
           WHERE s.StudentID = '$id'
        ) AND s.StudentID = '$id'";
            
        $cmresult = mysqli_query($conn, $cmsql);
        
       ?>

        <table class="pure-table"><thead><tr><th><b>Course Material</b></th><th><b>Complete/Incomplete</b></th></tr></thead>
            <?php
            
            while($cmarow = mysqli_fetch_assoc($cmresult))
            {
                $coursemname = $cmarow['Course_Material'];        
                $cflag = $cmarow['Complete_Incomplete'];
                echo "<tr><td>".$coursemname."</td><td>".$cflag."</td></tr>"; 

            }

        ?>
        </table><br>
<!-- update course materials that are complete -->
        <?php
            if (isset($_POST['comp_btn']))
            {
                $cname = mysql_real_escape_string($_POST['course']);
                
                $markcomp = "UPDATE CM_Complete
                    INNER JOIN C_Material ON CM_Complete.CMID = C_Material.CMID
                    INNER JOIN Student ON CM_Complete.StudentID = Student.StudentID
                    SET CM_Complete.cFlag = 1, CM_Complete.Date = CURDATE(), CM_Complete.Time = CURTIME()
                    WHERE Student.StudentID = '$id' AND C_Material.Name = '$cname'";
                
                $compcourse = "SELECT IF 
                    ( 
               (
                  SELECT COUNT(cm.CMID)
                  FROM C_Material cm INNER JOIN Course c ON cm.CourseID = c.CourseID
                  WHERE c.CourseID = 1) = 
               (
                  SELECT SUM(cc.cFlag)
                  FROM CM_Complete cc INNER JOIN C_Material cm ON cc.CMID = cm.CMID
                     INNER JOIN Student s ON cc.StudentID = s.StudentID
                  INNER JOIN Course c ON c.CourseID = cm.CourseID
                  WHERE s.StudentID = '$id' AND c.CourseID = '$cname'
               ) 
               , 'Course Completed' , 'Incomplete Course Materials'
            ) AS Complete_Incomplete";
                
                $markresult = mysqli_query($conn, $markcomp);
                $compresult = mysqli_query($conn, $compcourse);
                
                header("Location: Refresh:0");
            }
        ?>
        

         <form class="pure-form pure-form-aligned" method = POST action ="">
            <input type="text" name ="course" placeholder= "Course Material Name">
            <input type="submit" class="pure-button" name= "comp_btn" value = "Mark as Complete">
            </form>
     </div>   

    
    
    </div>
    

     
</body>
    
</html>

