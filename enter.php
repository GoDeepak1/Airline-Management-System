<?php
session_start();
if (!isset($_SESSION["sess_ename"])) {
    header("location:emplogin.php");
} else {
?>

<!DOCTYPE html>
<html>
<head>
    <title>Welcome Employee</title>
    <style>
        body {
            background-image: url("crew.jpg");
            margin-top: 60px;
            margin-bottom: 10px;
            margin-right: 80px;
            margin-left: 80px;
            background-size: 60%;
            background-attachment: fixed;
            color: #261A15;
            font-family: 'Yantramanav', sans-serif;
            font-size: 70%;
        }

        h1 {
            color: red;
        }

        h3 {
            color: rgb(44, 62, 80);
            font-family: verdana;
            font-size: 100%;
        }

        a {
            color: rgb(102, 51, 153);
        }

        fieldset {
            background-color: rgba(255, 255, 255, 0.7); /* Whitish blue background with transparency */
            color: #333; /* Text color */
            border: 1px solid #ccc; /* Add border */
            border-radius: 10px; /* Add border radius */
            padding: 20px; /* Add padding */
        }

        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            padding: 10px;
        }

        .form-container input[type="text"],
        .form-container input[type="number"] {
            padding: 10px;
            margin: 1px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 400px; /* Adjust width as needed */
            background-color: rgba(255, 255, 255, 0.9); /* Slightly transparent white background */
        }

        .form-container input[type="submit"] {
            padding: 10px 20px;
            margin: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007bff; /* Blue button color */
            color: #fff; /* Button text color */
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container input[type="submit"]:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

        .form-container legend {
            padding: 10px;
            border: none; /* Remove border */
            border-radius: 5px; /* Add border radius */
            background-color: rgba(255, 255, 255, 0.7); /* Whitish blue background with transparency */
        }
    </style>
</head>
<body>
    <center><h1><u> AIRLINE RESERVATION SYSTEM </u></h1></center>
    <br><h2>Welcome</h2>

    <div class="logout-container">
        <button class="button">
            <a href="logout.php"  style="color:black">Logout</a>
        </button>
    </div>

    <div class="view-bookings-container">
        <form action="view.php" method="POST"> 
            <input type="submit" value="View Bookings" style="color:black" /><br><br>
        </form>
    </div>

    <div class="form-container">
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
            <legend>
                <fieldset>
                    <center>
                        <br>
                        <h2>Enter Flight Details: </h2><br>
                        <b> Flight id: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</b><input type="text" name="fid"><br><br>
                        <b> Plane name:  &nbsp;&nbsp;</b><input type="text" name="planename"><br><br>
                        <b> Pickup:  &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;</b><input type="text" name="from"><br><br>
                        <b> Destination:   &nbsp;</b><input type="text" name="to"><br><br>
                        <b> Departure Time:   &nbsp;</b><input type="text" name="deptime"><br><br>
                        <b> Arrival Time:   &nbsp;</b><input type="text" name="arrtime"><br><br>
                        <b> Fare:  &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</b><input type="number" name="fare"><br><br>
                        <b> Departure Date:   &nbsp;</b><input type="text" name="depdate"><br><br>
                        &emsp; &emsp; &emsp; &emsp; &emsp;<input type="submit" value="Insert flight details" name="insert" /><br><br>
                    </center>
                </fieldset>
            </legend>
        </form>
    </div>
</body>
</html>

<?php
if (isset($_POST["insert"])) {
    if (!empty($_POST['fid']) && !empty($_POST['planename']) && !empty($_POST['from']) && !empty($_POST['to']) && !empty($_POST['deptime']) && !empty($_POST['fare']) && !empty($_POST['arrtime']) && !empty($_POST['depdate'])) {
        $fid = $_POST['fid'];
        //$seats=$_POST['seats'];
        $planename = $_POST['planename'];
        $from = $_POST['from'];
        $to = $_POST['to'];
        $deptime = $_POST['deptime'];
        $arrtime = $_POST['arrtime'];
        $fare = $_POST['fare'];
        $depdate = $_POST['depdate'];
        $con = @mysqli_connect('localhost', 'root', '', 'airline') or die(mysql_error());

        $sql = "SELECT * FROM aircraft WHERE Dep_Time='$deptime' AND Flight_ID='$planename'";
        $query = mysqli_query($con, $sql);
        $numrows = mysqli_num_rows($query);
        if ($numrows == 0) {
            // $sql="INSERT INTO custlogin(username,idproof,age,email,contactnum,password) VALUES('$user','$id','$age','$email','$cnum','$pass')";
            $sql = "INSERT INTO aircraft(Flight_ID,Dep_Time,Arr_Time,Plane_Name,Src,Dstn,Fare,Dep_Date) VALUES('$fid','$depdate','$arrtime','$planename','$from','$to','$fare','$depdate');";

            $result = mysqli_query($con, $sql);
            //$lastInsertID =  mysqli_insert_id($con);
            if ($result) {
                echo " Successfully Inserted..  ";
            } else {
                echo "Failure!";
            }
        } else {
            echo "That entry(or Pid) already exists! Please try again with another.";
        }
    } else {
        echo "All fields are required!";
    }
}
}
?>

