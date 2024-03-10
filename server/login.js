const app = express();

// Login API endpoint
app.post('/api/v1/login', (req, res) => {
    const { email, password } = req.body;
    // Check if username and password match
    db.get('SELECT * FROM users WHERE email = ? AND password = ?', [email, password], (err, user) => {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }
        if (!user) {
            res.status(401).json({ error: 'Invalid email or password' });
            return;
        }
        // Generate JWT token
        const token = jwt.sign({ id: user.id, email: user.email }, 'secret', { expiresIn: '24h' });

        // Return user profile data along with token
        const newUser = {
            user: {
                id: user.id,
                first_name:user.firstName,
                last_name:user.lastName,
                email: user.email,
                phone:user.phone
                // Add more user profile data as needed
            },
            token: token
        };
        console.log('Response Body:', newUser);
        res.json(newUser);
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
