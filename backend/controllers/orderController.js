const db = require('../utils/db');
const { authenticateToken } = require('../middlewares/authMiddleware');

exports.createOrder = (req, res) => {
  const { id: user_id } = req.user;
  const { product_size } = req.body;

  if (!product_size) return res.status(400).send('Product size is required');

  const query = `
    INSERT INTO orders (user_id, name, phone_number, address, order_created_at, product_size) 
    SELECT ?, username, phone_number, address, NOW(), ? 
    FROM users 
    WHERE id = ?
  `;

  db.query(query, [user_id, product_size, user_id], (err, result) => {
    if (err) {
      return res.status(500).send('Internal Server Error');
    }
    res.status(201).json({ id: result.insertId });
  });
};
