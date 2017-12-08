<?php
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

    <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/grids-responsive-min.css">
    <link rel="stylesheet" href="home.css">
</head>
    
<body>
    <div class="header">
        <div class="home-menu pure-menu pure-menu-horizontal pure-menu-fixed">
            <a class="pure-menu-heading" href="index.php">Trainly</a>

            <ul class="pure-menu-list">
                <li class="pure-menu-item pure-menu"><a href="homefaculty.php" class="pure-menu-link">Home</a></li>
                                <li class="pure-menu-item"><a href="facultystuhome.php" class="pure-menu-link">Student Page</a></li>
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
         <h3 class="content-head is-center">FACULTY MEMBER: <?php echo $_SESSION['first'] . " " . $_SESSION['last']; ?></h3>  
            
    </div>

    <div class="pure-g" style="padding: 30px;">
        <p>
        <?php
            
            $email = $_SESSION['email'];
            $idsql = "SELECT s.StudentID FROM Student s WHERE s.Email = '$email'";
            $result2 = mysqli_query($conn, $idsql);
                     
            //get StudentID 
            $row = mysqli_fetch_assoc($result2);
            $id = ($row['StudentID']);
                
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
       
        <!--ENROLLED COURSES*/-->
        <div class="pure-u-1-2">
            <h4>You are currently enrolled in:</h4>
            <p>
            <?php
                    
                    echo "<table class='pure-table'><thead><tr><th><b>Course Name</th><th><b>Primary Topic</th><th><b>Secondary Topics</th></tr></thead><tbody>";
                    while($enrollcourserow = mysqli_fetch_assoc($enrollcourseresult))
                    {
                    $coursename = $enrollcourserow['Course_Name'];        
                    $pritopic = $enrollcourserow['Primary_Topic'];
                    $sectopic = $enrollcourserow['Secondary_Topics'];
                    echo "<tr><td>".$coursename."</td><td>".$pritopic."</td><td>".$sectopic."</td></tr>";  
                    }

                echo "</tbody></table>";
                
            ?>
            </p>
            
            <p>To enroll in more courses, click <a href="enroll.php" class="pure-button pure-button-primary">here.</a></p>

        </div>
        
        
        
        
        <!--INTERESTED COURSES*/-->
        <div class="pure-u-1-2">
        <?php
            $interestcoursesql = "(SELECT c.Name AS Course_Name, c.Pri_Topic AS Primary_Topic, st.Topic AS Secondary_Topics,'Interested' AS Category
            FROM ((Student s INNER JOIN Interest i ON s.StudentID = i.StudentID)
           INNER JOIN Course c ON i.CourseID = c.CourseID)
           INNER JOIN Sec_topic st ON c.CourseID = st.CourseID
            WHERE s.StudentID = '$id')";
        
            $interestcourseresult = mysqli_query($conn, $interestcoursesql);
            
        ?>
        <h4>You are currently interested in:</h4>
        <p>
        <?php
            
        echo "<table class='pure-table'><thead><tr><th>Course Name</th><th>Primary Topic</th><th>Secondary Topics</th></tr></thead>";
        while($interestcourserow = mysqli_fetch_assoc($interestcourseresult))
        {
            $coursename = $interestcourserow['Course_Name'];        
            $pritopic = $interestcourserow['Primary_Topic'];
            $sectopic = $interestcourserow['Secondary_Topics'];
            echo "<tr><td>".$coursename."</td><td>".$pritopic."</td><td>".$sectopic."</td></tr>";   
        }
            echo "</table>";
            
        ?>
            
        </p>
         <p>To add to your course interests, click <a href="interest.php" class="pure-button pure-button-primary">here.</a></p>
        </div>

        <div class="pure-u-1-2">
       

        
        
        <!--COMPLETED COURSES*/-->
            <?php
            $compcoursesql = "SELECT c.Name AS Course_Name, c.Pri_Topic AS Primary_Topic, st.Topic AS Secondary_Topics,'Completed' AS Category
        FROM ((Student s INNER JOIN Enroll_in e ON s.StudentID = e.StudentID)
        INNER JOIN Course c ON e.CourseID = c.CourseID)
        INNER JOIN Sec_topic st ON c.CourseID = st.CourseID
        WHERE s.StudentID = '$id' AND e.C_date IS NOT NULL";
        
            $compcourseresult = mysqli_query($conn, $compcoursesql);
            
        ?>
        </div>

        <div class="pure-u-1-2">
        <h4>You have completed:</h4>
        <p>
        <?php
            
        echo "<table class='pure-table'><thead><tr><th><b>Course Name</th><th><b>Primary Topic</th><th><b>Secondary Topics</th></tr></thead><tbody>";
        while($compcourserow = mysqli_fetch_assoc($compcourseresult))
        {
            if (!isset($compcourserow['Course_Name']))
            {

                $coursename = $compcourserow['Course_Name'];        
                $pritopic = $compcourserow['Primary_Topic'];
                $sectopic = $compcourserow['Secondary_Topics'];
                echo "<tr><td>".$coursename."</td><td>".$pritopic."</td><td>".$sectopic."</td></tr>"; 
            }
            else
            {
                echo "You havent completed any class";
            }
        }
            echo "</tbody></table>";
            
        ?>
        </p>
        
        </div>
        
        <div class="pure-u-1-2">
            <h4>Your Course Materials:</h4>
            <?php 
            
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
            
            while ($cmrow = mysqli_fetch_assoc($cmresult))
            {
                echo $cmrow['Course_Material'] . "  " . $cmrow['Complete_Incomplete'] . "<br>";
            }
          ?>
        </div>
    </div>
   
</body>
    
    
</html>

