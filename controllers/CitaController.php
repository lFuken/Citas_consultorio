<?php

namespace Controllers;

use Model\Cita;
use Model\Usuario;
use MVC\Router;

class CitaController {
    public static function index (Router $router){
        session_start();
        isAuth();

        $router->render('cita/index', [
            'nombre' => $_SESSION['nombre'],
            'id' => $_SESSION['id']
        ]);
    }

    public static function actualizar (Router $router){
        session_start();
        isAdmin();

        $id = validarORedireccionar('/admin');
        $cita = Cita::find($id);
        $consulta = "SELECT CONCAT( usuarios.nombre, ' ', usuarios.apellido) AS cliente from citas LEFT OUTER JOIN usuarios ON citas.usuarioId=usuarios.id WHERE citas.id = '$id'";
        $usuario = Cita::SQL($consulta);
        $errores = Cita::getAlertas();
        $alertas = [];

        if($_SERVER['REQUEST_METHOD'] === 'POST'){
            //Asignar los atributos
            $args = $_POST['cita'];

            //buscar si existe Cita
            $query = "SELECT * FROM citas WHERE fecha ='".$args['fecha']."' AND hora = '" . $args['hora'] . "'";
            $resultado = Cita::SQL($query);

            if($resultado){
                Cita::setAlerta('error', 'Hora ya ocupada');
                $alertas = Cita::getAlertas();
            }else{
                $cita->sincronizar($args);
            //Validacion
                $errores = $cita->validar();
    
                if(empty($errores)){
                $cita->guardar();
                header('Location: /admin');
            }
            }
        }

        $router->render('/cita/actualizar', [
            'nombre' => $_SESSION['nombre'],
            'cita' => $cita,
            'errores' => $errores,
            'usuario' => $usuario,
            'alertas' => $alertas

        ]);
    }
}