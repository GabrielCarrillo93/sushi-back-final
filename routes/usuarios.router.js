const express = require('express');
const router = express.Router();
const controlador = require('../controllers/usuarios.controller')

app.post("/validar", controlador.validar)