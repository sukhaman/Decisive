const sqlite3 = require('sqlite3').verbose();

const app = express();


// Connect to SQLite database
const db = new sqlite3.Database('users.db');

// Create users table if not exists
db.serialize(() => {
    db.run(`
        CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            firstName TEXT,
            lastName TEXT.
            phone INTEGER,
            email TEXT,
            password TEXT
        )
    `);
});

// Create a new user
app.post('/api/v1/registration', (req, res) => {
    const { first_name,last_name,phone, email,password } = req.body;

    db.run('INSERT INTO users (firstName,lastName, phone, email,password) VALUES (?, ?, ?,?,?)', [first_name,last_name, phone, email,password], function(err) {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }

        res.json({
            id: this.lastID,
            first_name: firstName,
            last_name:lastName,
            phone:phone,
            email: email
        });
    });
});


// Login API endpoint
app.post('/api/login', (req, res) => {
    const { username, password } = req.body;

    // Check if username and password match
    db.get('SELECT * FROM users WHERE username = ? AND password = ?', [username, password], (err, user) => {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }

        if (!user) {
            res.status(401).json({ error: 'Invalid username or password' });
            return;
        }

        // Generate JWT token
        const token = jwt.sign({ id: user.id, username: user.username }, JWT_SECRET, { expiresIn: '1h' });

        // Return user profile data along with token
        res.json({
            user: {
                id: user.id,
                username: user.username,
                email: user.email
                // Add more user profile data as needed
            },
            token: token
        });
    });
});

// Middleware to verify JWT token
function verifyToken(req, res, next) {
    const token = req.headers['authorization'];

    if (!token) {
        res.status(401).json({ error: 'Token not provided' });
        return;
    }

    jwt.verify(token, JWT_SECRET, (err, decoded) => {
        if (err) {
            res.status(401).json({ error: 'Invalid token' });
            return;
        }

        req.user = decoded;
        next();
    });
}

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

