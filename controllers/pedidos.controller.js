const db = require('../db/db')

const storePedidos = (req, res) => {
  
  const { fecha, id_carrito } = req.body;

  const sql = "INSERT INTO pedidos (fecha, id_carrito) VALUES (?, ?)";
  db.query(sql, [fecha, id_carrito], (error, result) => {
    if (error) {
      return res.status(500).json({ error: "Intente mas tarde" });
    }

    res.json(result);
  });
};

module.exports = {
    storePedidos
}