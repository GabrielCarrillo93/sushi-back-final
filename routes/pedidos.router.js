const express = require('express');
const router = express.Router();
const controller = require("../controllers/pedidos.controller");


router.post("/", controller.storePedidos);

