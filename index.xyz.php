<!-- <?php
if (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') {
    $uri = 'https://';
} else {
    $uri = 'http://';
}
$uri .= $_SERVER['HTTP_HOST'];
header('Location: ' . $uri . '/dashboard/');
exit;
?> -->


<!-- <?php
	if (!empty($_SERVER['HTTPS']) && ('on' == $_SERVER['HTTPS'])) {
		$uri = 'https://';
	} else {
		$uri = 'http://';
	}
	$uri .= $_SERVER['HTTP_HOST'];
	header('Location: '.$uri.'/dashboard/');
	exit;
?>  -->

<?php
session_start();

// Check if the user is logged in
if(isset($_SESSION['user_id'])) {
    // Redirect logged-in users to the dashboard
    header("Location: dashboard.php");
    exit();
}

// Check if the employee is logged in
if(isset($_SESSION['emp_id'])) {
    // Redirect logged-in employees to the dashboard
    header("Location: emp_dashboard.php");
    exit();
}

// Include header or any other common HTML elements
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Airline Reservation System</title>
</head>
<body>
    <h1>Welcome to Airline Reservation System</h1>
    <ul>
        <li><a href="login.php">User Login</a></li>
        <li><a href="emplogin.php">Employee Login</a></li>
    </ul>
    <!-- You can add more content here -->
</body>
</html>

<?php
// Include footer or any other common HTML elements
?>





	