const express = require('express');
const bodyParser = require('body-parser');
const jwt = require('jsonwebtoken');
const sqlite3 = require('sqlite3').verbose();
const { log } = require('console');
const port = 8000; // You can use any port number you prefer
const app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(express.static("public"));
// Define a route for the homepage
app.get('/', (req, res) => {
  res.send('Hello, World! This is your local server.');
});


app.use(bodyParser.json());


// Connect to SQLite database
const db = new sqlite3.Database('users.db');

// Create users table if not exists
db.serialize(() => {
    db.run(`
        CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            firstName TEXT,
            lastName TEXT,
            phone INTEGER,
            email TEXT,
            password TEXT
        )
    `);
});

// Create a new user
app.post('/api/v1/registration', (req, res) => {
    const { first_name, last_name, phone,email,password } = req.body;
    // Check if firstName and lastName are provided in the request body
    if (!first_name || !last_name) {
        res.status(400).json({ error: 'firstName and/or lastName are missing in the request body' });
        return;
    }
    db.run('INSERT INTO users (firstName,lastName, phone, email,password) VALUES (?, ?, ?, ?, ?)', [first_name,last_name, phone, email,password], function(err) {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }
        const newUser = {
            id: this.lastID,
            first_name: first_name,
            last_name: last_name,
            phone: phone,
            email: email
        };
        console.log('Response Body:', newUser);
        res.json(newUser);
    });
});

// return all users
app.get('/api/v1/users', (req, res) => {
    // Query the database to retrieve all user records
    db.all('SELECT * FROM users', (err, users) => {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }

        res.json(users); // Return user data as JSON
    });
});

// delete all users
app.delete('/api/v1/user/delete', (req, res) => {
    // Delete all records from the users table
    db.run('DELETE FROM users', function(err) {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }
        res.json({ message: 'All users deleted successfully' });
    });
});


// Profile API endpoint (requires authentication)
app.get('/api/profile', verifyToken, (req, res) => {
    const userId = req.user.id;

    // Retrieve user profile data from the database
    db.get('SELECT * FROM users WHERE id = ?', [userId], (err, user) => {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }

        if (!user) {
            res.status(404).json({ error: 'User not found' });
            return;
        }

        // Return user profile data
        res.json({
            id: user.id,
            username: user.username,
            email: user.email
            // Add more user profile data as needed
        });
    });
});


// Start the server
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
