<?php

namespace Controllers;

use Model\Cita;
use Model\CitaServicio;
use Model\Servicio;

use function PHPSTORM_META\type;

class APIController {
    public static function index (){
        $servicios = Servicio::all();
        echo json_encode($servicios);
    }

    public static function guardar(){

        $allcitas = Cita::all();
        $cita = new Cita($_POST);

        $fechaCita = $cita->fecha;
        $horaCita = $cita->hora;

        $query = "SELECT * FROM citas WHERE fecha ='".$fechaCita."' AND hora = '" . $horaCita . "'";
        $resultado = Cita::SQL($query);

        
        if(count($resultado) != 0){
            echo json_encode(['resultado' => false]);
        }else{
            $resultado = $cita->guardar();

        $id = $resultado['id'];

        // Almacena la Cita y el Servicio

        // Almacena los Servicios con el ID de la Cita
        $idServicios = explode(",", $_POST['servicios']);
        foreach($idServicios as $idServicio) {
            $args = [
                'citaId' => $id,
                'servicioId' => $idServicio
            ];
            $citaServicio = new CitaServicio($args);
            $citaServicio->guardar();
        }

        echo json_encode(['resultado' => $resultado]);
        }    
    }

    public static function eliminar(){
        if($_SERVER['REQUEST_METHOD'] === 'POST'){
            $id = $_POST['id'];
            $cita = Cita::find($id);
            $cita->eliminar();
            header('Location:' . $_SERVER['HTTP_REFERER']);
        }
    }
    public static function atendido(){
        if($_SERVER['REQUEST_METHOD'] === 'POST'){
            $id = $_POST['id'];
            $cita = Cita::where('id', $id);
            if(empty($cita)) {
                // Mostrar mensaje de error
                header('Location:' . $_SERVER['HTTP_REFERER']);
            } else {
                // Modificar cita estado
                $cita->estado = "1";
                $cita->guardar();
                header('Location:' . $_SERVER['HTTP_REFERER']);
            }
        }
    }
}