



<!DOCTYPE html>  
<html>  
<head>  
    <title>Admin Login</title>  
    <style>   
        body{  
            background-image: url("crew.jpg");      
            margin-top: 100px;  
            margin-bottom: 100px;  
            margin-right: 150px;  
            margin-left: 80px;  
            background-size: 100%;
            background-attachment: fixed; 
            color: #fff; /* Changed text color to white for better contrast */
            font-family: 'Yantramanav', sans-serif;
            font-size: 100%;  
        }  
        h1 {  
            color: red;
        }
        h3 {  
            color: #fff; /* Changed heading color to white */
            font-family: verdana;  
            font-size: 100%;  
        }
        a {
            color: #9ff; /* Changed link color to a lighter shade of blue */
            text-decoration: none; /* Removed underline from links */
        }
        fieldset {
            background-color: rgba(0, 0, 0, 0.7);
            color: #fff;
            opacity: 0.8;
            border: none;
            padding: 20px;
            border-radius: 10px;
            width: 400px; /* Increased width of the form */
            margin: auto;
        }
        input[type="text"],
        input[type="password"] {
            width: calc(100% - 40px); /* Adjusted width of input fields */
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.9); /* Reduced opacity of input background */
            outline: none;
            color: #000; /* Changed input text color to black for better visibility */
        }
        .button-container {
            display: flex;
            justify-content: space-between; /* Added space between buttons */
        }
        .return-btn,
        .login-btn {
            background-color: #007bff; /* Changed button background color to a shade of blue */
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
            width: 150px; /* Increased button width */
        }
        .return-btn:hover,
        .login-btn:hover {
            background-color: #0056b3; /* Darker shade of blue on hover */
        }
    </style>  
</head>  
<body>  
    <br><center><h1><u> AIRLINE RESERVATION SYSTEM </u></h1></center>  <br>  
    <br />
    <legend>  
        <fieldset>
            <center>
                <br>
                <h3>Admin Login Form</h3>  
                <form action="" method="POST">  
                    <input type="text" name="empname" placeholder="Employee Name" style="background-color: #fff; color: #000;"><br />  
                    <input type="password" name="emppass" placeholder="Password" style="background-color: #fff; color: #000;"><br />   <br>
                    <div class="button-container">
                        <input type="submit" value="Login" name="submit" class="login-btn" /> 
                        <button type="button" class="return-btn" onclick="goBack()">Return</button>
                    </div>
                </form>
            </center>
        </fieldset>  
    </legend> 
    <?php  
        $con=mysqli_connect("localhost","root","","airline");
        //mysql_select_db("Practice")
        //if (isset($_POST['email']))

        if(isset($_POST['submit']))
        {
            $empname = $_POST['empname'];
            $emppass = $_POST['emppass'];

            $sql="SELECT * FROM admin WHERE Name='".$empname."' AND Pswd='".$emppass."'";
            $query=mysqli_query($con,$sql);  
            $numrows=mysqli_num_rows($query);  
            if($numrows!=0)  
            {  
                while($row=mysqli_fetch_assoc($query))  
                {  
                    $dbename=$row['Name'];  
                    $dbpassword=$row['Pswd'];  
                }  

                if($empname == $dbename && $emppass == $dbpassword)  
                {  
                    session_start();  
                    $_SESSION['sess_ename']=$empname;  

                    /* Redirect browser */  
                    header("Location: enter.php");  
                }  
            } 
            else 
            {  
                echo "Invalid username or password!";  
            }  
        }
    ?>
    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</body>  
</html>
