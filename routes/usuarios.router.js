const express = require('express');
const router = express.Router();
const controlador = require('../controllers/usuarios.controller')

router.get('/', controlador.usuarios)
router.post("/registrar", controlador.registrar)

module.exports = router