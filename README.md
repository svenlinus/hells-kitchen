## Run instructions:
First, create the hellskitchen database by running the hellskitchen.sql file.

To connect to the database, in the backend directory, create a file named .env
In the .env file, add one line that stores your sql password:
MYSQL_PASSWORD='YOUR_PASSWORD'

In both the frontend and backend directories run:
npm install
npm start

Then go to the url printed by the frontend npm start command (localhost:3000 or some other port number).

If you get an error in the backend that authorization is invalid or something to that effect, then you 
need to change you database authorization settings. I (Sven) didn't have any issues but it didn't work 
as well for my teammates
