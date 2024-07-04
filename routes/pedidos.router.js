const express = require('express');
const router = express.Router();
const controller = require("../controllers/pedidos.controller");

router.get('/', controller.lista)
router.post("/", controller.storePedidos);

module.exports = router