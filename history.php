<html>
    <title>History</title>
    <head>
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
            <h2 class="content-subhead">Your Course History</h3>
             <?php
            
            /*Information needed for database connection*/
    session_start();
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "Trainly";
    /*Connect to database*/
    $conn = mysqli_connect($servername, $username, $password, $dbname);
    
    /*Set id to current users studentId */
    $id = $_SESSION['StudentID'];

    /*SQL to get information related to account history*/
    $ahistory = "SELECT c.Name AS Course_Name, e.Date AS Enrollment_Date, 
        e.C_date AS Completion_Date, c.Cost AS Price, e.Conf_Code AS Confirmation_Code, 
        (SELECT SUM(c.Cost) 
        FROM Course c INNER JOIN Enroll_in e ON c.CourseID = e.CourseID
        INNER JOIN Student s ON e.StudentID = s.StudentID
        WHERE s.StudentId = '$id') AS Total_Spent
        FROM Course c INNER JOIN Enroll_in e ON c.CourseID = e.CourseID
        INNER JOIN Student s ON e.StudentID = s.StudentID
        WHERE s.StudentID = '$id'
        ORDER BY c.Name";
    $historyresult = mysqli_query($conn, $ahistory);

    /*Creates table to display information */
    echo "<table class='pure-table'>
    <thead>
    <tr>
    <th>Course Name</th>
    <th>Enrollment Date</th>
    <th>Completion Date</th>
    <th>Price</th>
    <th>Confirmation Code</th>
    </tr>
    </thead>
    <tbody>";

    /*Print out information for all rows from SQL query statement */
    while($historyrow = mysqli_fetch_assoc($historyresult))
    {
            $coursename = $historyrow['Course_Name'];        
            $enrolldate = $historyrow['Enrollment_Date'];
            $cdate = $historyrow['Completion_Date'];
            $price = $historyrow['Price'];
            $code = $historyrow['Confirmation_Code'];
        
        
        echo "<tr><td>".$coursename."</td><td>".$enrolldate."</td><td>".$cdate."</td><td>".$price."</td><td>".$code."</td></tr>";
    }

    echo "</tbody></table>";

?>

        </div>
   

    </body>
</html>


