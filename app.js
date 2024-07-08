require("dotenv").config()
const express = require("express")
const app = express()
const cors = require('cors')
const PORT = process.env.PORT || 3001

app.use(express.json())
app.use(cors())

app.use('/carrito', require('./routes/carrito.router'));

app.use('/producto', require('./routes/productosushi.router'));

app.use('/pedidos', require('./routes/pedidos.router'));

app.use('/usuarios', require('./routes/usuarios.router'));


app.get('/', (req, res) => {
    res.send(`¡Bienvenidos a Sushi Sensai!`)
})

app.listen(PORT, () => console.log(`http://localhost:${PORT}`))