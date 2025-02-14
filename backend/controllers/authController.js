const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const db = require('../utils/db');
const JWT_SECRET = 'your_jwt_secret';

exports.register = async (req, res) => {
  const { username, password, phone_number, address } = req.body;
  const role = 'customer';

  if (!username || !password || !phone_number || !address) {
    return res.status(400).send('Please provide all required fields');
  }

  try {
    const hashedPassword = await bcrypt.hash(password, 10);
    db.query('INSERT INTO users (username, password, phone_number, address, role) VALUES (?, ?, ?, ?, ?)', 
      [username, hashedPassword, phone_number, address, role], 
      (err) => {
        if (err) {
          return res.status(500).send('Error registering user');
        }
        res.status(201).send('User registered successfully');
      }
    );
  } catch (error) {
    res.status(500).send('Internal Server Error');
  }
};

exports.login = (req, res) => {
  const { username, password } = req.body;

  db.query('SELECT * FROM users WHERE username = ?', [username], async (err, results) => {
    if (err) return res.status(500).send('Error on the server');
    if (results.length === 0) return res.status(404).send('User not found');

    const user = results[0];
    const validPassword = await bcrypt.compare(password, user.password);
    if (!validPassword) return res.status(401).send('Invalid password');

    const token = jwt.sign({ id: user.id, role: user.role }, JWT_SECRET);
    res.json({ token });
  });
};
