const db = require("../db/db");

// GET
const index = (req, res) => {
    const sql = "SELECT * FROM productosushi"; 
    db.query(sql, (error, rows) => {
        if (error) {
            return res.status(500).json({ error: "No se pudo procesar su solicitud. Consulte más tarde" });
        }
        res.json(rows);
    });
};
    
// POST
const createProduct = (req, res) => {
    const { Nombre, Descripcion, Precio, Categoria_ID, Ingredientes, Disponible } = req.body;
    const insertSql = "INSERT INTO productoSushi (Nombre, Descripcion, Precio, Categoria_ID, Ingredientes, Disponible) VALUES (?, ?, ?, ?, ?, ?)";
    
    db.query(insertSql, [Nombre, Descripcion, Precio, Categoria_ID, Ingredientes, Disponible], (error, results) => {
        if (error) {
            return res.status(500).json({ error: "Intente más tarde" });
        }
        
        const newProductId = results.insertId;
        show({ params: { id: newProductId } }, res);
    });
};

// GET by ID
const show = (req, res) => {
    const { id } = req.params;
    const sql = "SELECT * FROM productoSushi WHERE ID_Producto = ?";
    db.query(sql, [id], (error, rows) => {
        if (error) {
            return res.status(500).json({ error: "Intente más tarde" });
        }
        if (rows.length == 0) {
            return res.status(404).json({ error: "No existe el producto" });
        }
        res.json(rows[0]);
    });
};

// PUT
const update = (req, res) => {
    const { id } = req.params;
    const { Nombre, Descripcion, Precio, Categoria_ID, Ingredientes, Disponible } = req.body;
    const sql = "UPDATE productoSushi SET Nombre = ?, Descripcion = ?, Precio = ?, Categoria_ID = ?, Ingredientes = ?, Disponible = ? WHERE ID_Producto = ?";
    db.query(sql, [Nombre, Descripcion, Precio, Categoria_ID, Ingredientes, Disponible, id], (error, result) => {
        if (error) {
            return res.status(500).json({ error: "Intente más tarde" });
        }
        if (result.affectedRows == 0) {
            return res.status(404).json({ error: "No existe el producto" });
        }
        const producto = { ...req.body, ID_Producto: id };
        res.json(producto);
    });
};

// DELETE
const destroy = (req, res) => {
    const { id } = req.params;
    const sql = "DELETE FROM productoSushi WHERE ID_Producto = ?";
    db.query(sql, [id], (error, result) => {
        if (error) {
            return res.status(500).json({ error: "Intente más tarde" });
        }
        if (result.affectedRows == 0) {
            return res.status(404).json({ error: "No existe el producto" });
        }
        res.json({ mensaje: `Producto ${id} borrado` });
    });
};

module.exports = {
    index,
    createProduct,
    show,
    update,
    destroy,
};
