# Recipe App

## Instructions:
1. Ensure the following are installed:
- Node.js
- MySQL Server
- MySQL Workbench

2. Clone the Project
- Run "git clone https://github.com/Gavin-Letulle/SEHW2" in the terminal

3. Set Up the Database:
- Open MySQL Workbench and connect to your MySQL server.
- Go to: File → Open SQL Script.
- Select: create_and_populate_db.sql from the project folder.
- Run the script by clicking Execute All (Ctrl+Shift+Enter).

4. Install Node.js dependencies:
- Run "npm install" in the terminal

5. Configure the database conection:
- Open /database/connection.js and replace the username and password with your own information

6. Start the server:
- Run "npm start" in the terminal

7. App Usage:
- Open a browser and go to: http://localhost:3000
- Navigate the website and add/view recipes!