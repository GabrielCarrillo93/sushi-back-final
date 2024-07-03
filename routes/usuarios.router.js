const express = require('express');
const router = express.Router();
const controlador = require('../controllers/usuarios.controller')

router.post("/validar", controlador.validar)

module.exports = router