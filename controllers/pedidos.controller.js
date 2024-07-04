const db = require('../db/db')


const lista = (req, res) => {
    const sql = "select * from pedidos"
    db.query(sql, (err, rows) => {
        if (err) {
            return res.status(500).json(err)
        }
        res.status(201).json(rows)
    })
}

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
    storePedidos,
    lista
}