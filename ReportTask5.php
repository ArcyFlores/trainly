
<html>
    <head>
        <title>Questions</title>
        <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css" integrity="sha384-nn4HPE8lTHyVtfCBi5yW9d20FjT8BJwUXyWZT9InLYax14RDjBj46LmSztkmNP9w" crossorigin="anonymous">
        <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/grids-responsive-min.css">
        <link rel="stylesheet" type="text/css" href="home.css">
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
   <div class="container-padding bottom-padding">
    <h3 class="content-head">Report Task 5:</h3>
    <h3>Produce a list of course material questions
    related to the user inputted course along with faculty first and last name who answered it and the answer it self. Show the number of likes of each question and order them by highest number of likes.</h3>


<!--query that gets results for report 5-->

    <div class="sql-query">
    <h4>Motivation:</h4>
    <p>Based on the User selected course name, all related questions to the
        course materials are shown with their respective answers, so the user
        is able to see if his/her doubts have been addressed before submitting
        a new question.</p>
    </div>
<!-- form to get results  -->
    <form method = "POST" class="pure-form" action = "ReportTask5.php">
        <input placeholder="Course ID" type="text" name ="CourseID" required>
        <input type="submit" class="pure-button" name= "report_task5_btn" value = "Search">
    </form>
       
<!--  connect to db -->
<?php
    session_start();
    $servername = "localhost";

    $username = "root";
    $password = "";
    $dbname = "Trainly";

    $conn = mysqli_connect($servername, $username, $password, $dbname);

//        query db
    if (isset($_POST['report_task5_btn']))
    {
        $CourseID = mysql_real_escape_string($_POST['CourseID']);


        $sql_reporttask5 = 
        "SELECT s.F_Name, s.L_Name, cq.Context, j.Answer, COUNT(sl.StudentID) AS Num_of_Likes
        FROM Student s INNER JOIN Faculty f ON s.StudentID = f.StudentID
            INNER JOIN Judge j ON f.StudentID = j.F_ID
            INNER JOIN C_Question cq ON j.CQID = cq.CQID AND j.CourseID = cq.CourseID
            INNER JOIN s_like sl ON cq.CQID = sl.CQID AND cq.CourseID= sl.CourseID
            INNER JOIN Student s1 ON sl.StudentID = s1.StudentID
        WHERE j.CQID IN (

        SELECT j.CQID 
        FROM Judge j INNER JOIN C_Question cq ON j.CQID = cq.CQID
        WHERE cq.CQID IN (

        SELECT cq.CQID
        FROM C_Question cq INNER JOIN Course c ON cq.CourseID = c.CourseID
        WHERE c.CourseID = $CourseID )
        )
        GROUP BY cq.CQID, cq.CourseID
        ORDER BY COUNT(sl.StudentID) DESC, cq.CQID";

// get results and display on DOM as table
        $result= mysqli_query($conn, $sql_reporttask5);
        #$row = mysqli_fetch_assoc($result);
        echo "<table class='pure-table'> 
        <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Context</th>
                <th>Answer</th>
                <th>Number of Likes</th>
            </tr>
        </thead>
        <tbody>";
        while($taskresult_row = mysqli_fetch_assoc($result))
        {
            $First_Name = $taskresult_row['F_Name'];        
            $Last_Name = $taskresult_row['L_Name'];
            $Context = $taskresult_row['Context'];
            $Answer = $taskresult_row['Answer'];
            $Num_of_Likes = $taskresult_row['Num_of_Likes'];

            echo "<tr>     <td>".$First_Name."</td>
                            <td>".$Last_Name."</td>
                            <td>".$Context."</td>
                            <td>".$Answer."</td>
                            <td>".$Num_of_Likes."</td>
                </tr>";
        }
        echo "</tbody>
              </table>";
    }

?>
    </div>
    </body>
</html>




