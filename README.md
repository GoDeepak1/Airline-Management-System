# Airline-Management-System
The Airline Management System is a microservice-based application that facilitates efficient airline operations.
# Table-of-Contents
Project Overview
Features
Technologies Used
Installation
Usage
Contributing
License
Acknowledgments

# Project Overview
The Airline Management System is a full-stack application developed to simplify and streamline the operations of an airline. It covers essential functionalities such as:

# Managing flight schedules.
Booking and canceling tickets.
Handling passenger details efficiently.
Generating reports for operational insights.
This project is designed for students, developers, and enthusiasts who want to explore and understand the concepts of airline management systems in a modular and structured manner.

# Features
Flight Management: Add, update, and delete flight schedules.
Ticket Booking: Easy-to-use interface for booking and canceling tickets.
Passenger Management: Manage passenger details with accuracy.
Reports: Generate reports for daily flights and bookings.
Authentication: Secure login for administrators and users.

# Technologies-Used
# Frontend
HTML/CSS: For creating the user interface.
JavaScript: For interactive elements and dynamic features.
# Backend
Node.js: For server-side operations.
Express.js: For creating APIs and routing.
# Database
SQL: For storing and managing application data.
# Version Control
Git: For tracking changes in the source code.
# Installation
Follow these steps to set up the project locally:

#Install Dependencies
Make sure you have Node.js installed. Run the following command to install required packages:

Copy code
npm install  
Set Up the Database

Create a database in your preferred SQL environment.
Import the provided SQL schema file located in the db/ directory.

# Configure-Environment-Variables
Create a .env file in the root directory and add the following:

env
Copy code
DB_HOST=<your-database-host>  
DB_USER=<your-database-username>  
DB_PASS=<your-database-password>  
DB_NAME=<your-database-name>  
Start the Application

Copy code
npm start  
The application will run on http://localhost:3000/.

# Usage
# Admin Features:

Log in as an admin to manage flight schedules, passengers, and reports.
# User-Features:

# AirTicketBookingService
Description
This service handles ticket booking and cancellation operations. It integrates with the FlightsAndSearchService to retrieve flight details and ensures proper ticket allotment based on availability.

# Features
Book tickets for a selected flight.
Cancel tickets and process refunds.
Generate and manage booking records.
Integration with payment processing systems (optional).
# APIs
POST /bookTicket: Book a ticket for a specific flight.
DELETE /cancelTicket/{ticketId}: Cancel an existing ticket.
GET /bookingDetails/{userId}: Fetch all bookings for a specific user.

# Auth_Service
Description
The authentication service manages secure user login, registration, and role-based access for the application.

# Features
User registration and login.
JWT-based token generation for secure communication.
Role management (Admin, User).
# APIs
POST /register: Register a new user.
POST /login: Authenticate a user and issue a token.
GET /validateToken: Validate a user's token and retrieve user details.
# FlightsAndSearchService
Description
This service handles flight data and search functionalities, providing the necessary information for booking and management.

# Features
Add, update, and delete flight schedules (Admin only).
Search for flights based on source, destination, and date.
Retrieve flight details by ID.
# APIs
POST /addFlight: Add a new flight schedule.
PUT /updateFlight/{flightId}: Update flight details.
DELETE /deleteFlight/{flightId}: Delete a flight.
GET /searchFlights: Search flights by source, destination, and date.
GET /flightDetails/{flightId}: Fetch details of a specific flight.
