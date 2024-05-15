<!-- <!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Login Page</title>
		<link rel="stylesheet" type="text/css" href="style.css">
	</head>
	<body>
		<div class="loginBox">
			<img src="download.png" class="user" height="100" width="100">
			<h2>Log In Here</h2>
			<form action="login.php" method="post">
				<p>User Name</p>
				<input type="text" name="email" placeholder="Enter User Name">
				<p>Password</p>
				<input type="Password" name="pass" placeholder=".....">
				<input type="submit" name="submit" value="Sign In">
				<a href="signup.php">Signup</a>
			</form>
		</div>
	</body>
</html>
<?php
	$con=mysqli_connect("localhost","root","","airline");
	//mysql_select_db("Practice")
	//if (isset($_POST['email']))

	if(isset($_POST['submit']))
	{
		$email = $_POST['email'];
		$pass = $_POST['pass'];

		$sql="SELECT * FROM customer WHERE User_Name='".$email."' AND Pswd='".$pass."'";
    	$query=mysqli_query($con,$sql);  
    	$numrows=mysqli_num_rows($query);  
    	if($numrows!=0)  
    	{  
    		while($row=mysqli_fetch_assoc($query))  
    		{  
    			$dbename=$row['User_Name'];  
    			$dbpassword=$row['Pswd'];  
    		}  
  
    		if($email == $dbename && $pass == $dbpassword)  
    		{  
    			session_start();  
    			$_SESSION['sess_user']=$email;  
     
    			/* Redirect browser */  
    			header("Location: page1.php");  
    		}  
    	} 
    	else 
    	{  
    		echo "Invalid username or password!";  
    	}  
  }
//<!https://www.youtube.com/watch?v=ylFLVBbB9AM>
?> -->


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        .loginBox {
            width: 300px;
            padding: 40px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #fff;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.1);
        }

        .user {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            overflow: hidden;
            margin: 0 auto 20px auto;
        }

        .loginBox h2 {
            margin: 20px 0;
            color: #333;
        }

        .loginBox form p {
            margin: 10px 0;
            text-align: left;
            color: #333;
        }

        .loginBox form input[type="text"],
        .loginBox form input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .loginBox form input[type="submit"] {
            width: calc(100% - 20px);
            padding: 10px;
            border: none;
            background: #007bff;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .loginBox form input[type="submit"]:hover {
            background: #0056b3;
        }

        .loginBox a {
            text-decoration: none;
            color: #007bff;
        }

        .loginBox button {
            width: calc(100% - 20px);
            padding: 10px;
            border: none;
            background: #f1f1f1;
            color: #333;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
            margin-top: 20px;
        }

        .loginBox button:hover {
            background: #ddd;
        }
    </style>
</head>
<body>
<div class="loginBox">
    <img src="download.png" class="user" height="100" width="100">
    <h2>Log In Here</h2>
    <form action="login.php" method="post">
        <p>User Name</p>
        <input type="text" name="email" placeholder="Enter User Name">
        <p>Password</p>
        <input type="password" name="pass" placeholder=".....">
        <input type="submit" name="submit" value="Sign In">
        <a href="signup.php">Signup</a>
    </form>
    <button onclick="goBack()">Go Back</button>
    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</div>
</body>
</html>
