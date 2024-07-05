require("dotenv").config()
const express = require("express")
const app = express()
const PORT = process.env.PORT || 3001

app.use(express.json())

app.use('/carrito', require('./routes/carrito.router'));

app.use('/producto', require('./routes/productoSushi.router'));

app.use('/pedidos', require('./routes/pedidos.router'));

app.use('/usuarios', require('./routes/usuarios.router'));


app.get('/', (req, res) => {
    res.send(`¡Bienvenidos a Sushi Sensai en el puerto ${PORT}!`)
})

app.listen(PORT, () => console.log(`http://localhost:${PORT}`))