const db = require('../db/db')

const validar = (req, res) => {
    const datos = req.body;
    console.log(datos);

    let dniID = datos.dni;
    let nombre = datos.Nombre;
    let apellido = datos.Apellido;
    let correo = datos.Correo;
    let contrasena = datos.Contrasena;

    let buscar = "SELECT * FROM tabla_usuarios WHERE dni_ID = ?";

    conexion.query(buscar, [dniID], function (error, row) {
        if (error) {
            return res.status(500).json({error: "Hubo un error, intente nuevamente"})
        } else {
            if (row.length > 0) {
                res.status(404).json({error: "No se puede registrar, usuario existente"})
            } else {
                let registrar = "INSERT INTO tabla_usuarios (dni_ID, Nombre, Apellido, Correo, Contrasena) VALUES (?, ?, ?, ?, ?)";

                conexion.query(registrar, [dniID, nombre, apellido, correo, contrasena], function (error) {
                    if (error) {
                        return res.status(500).json({error: "Hubo un error, intente nuevamente"})
                    } else {
                        res.status(201).json({mensaje: "Datos almacenados correctamente. ¡Muchas gracias!"})
                    }
                });
            }
        }
    })
}

module.exports = {
    validar
}