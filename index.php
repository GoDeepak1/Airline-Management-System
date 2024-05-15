<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Airline Reservation System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('background2.jpg'); /* Add a background image */
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            color: #333; /* Change text color */
        }

        .container {
            width: 800px; /* Set a fixed width for desktop screens */
            margin: 50px auto;
            padding: 50px;
            background-color: rgba(255, 255, 255, 0.9); /* Add transparency to container */
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2); /* Increase shadow */
            text-align: center; /* Center align content */
        }

        h1 {
            color: #007bff; /* Change title color */
            margin-bottom: 20px; /* Add space below title */
        }

        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .button-container button {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin: 0 10px;
            transition: background-color 0.3s ease;
        }

        .button-container button:hover {
            background-color: #0056b3;
        }

        .image-container {
            text-align: center;
            margin-top: 50px;
        }

        .image-container img {
            width: 60%; /* Make the image fill its container */
            max-width: 80%;
            height: 40vh;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .quote {
            font-style: italic;
            margin-top: 30px;
            font-size: 18px;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Airline Reservation System</h1>
        <p>Experience the joy of flying with our world-class airline services.</p>
        
        <div class="button-container">
            <form action="emplogin.php" method="GET">
                <button type="submit">Employee Login</button>
            </form>
            
            <form action="login.php" method="GET">
                <button type="submit">Customer Login</button>
            </form>
        </div>

        <div class="quote">
            <p>"The sky is the limit only for those who aren't afraid to fly!"</p>
            <p>- Bob Bello</p>
        </div>

        <div class="image-container">
            <!-- Placeholder images (replace with actual images) -->
            <img src="background2.jpg" alt="Airplane">
        </div>
    </div>
</body>
</html>
