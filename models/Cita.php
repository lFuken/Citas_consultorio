<?php


namespace Model;

class Cita extends ActiveRecord {
    //Base de datos

    protected static $tabla = 'citas';
    protected static $columnasDB = ['id','fecha','hora','usuarioId','estado'];

    public $id;
    public $fecha;
    public $hora;
    public $usuarioId;
    public $estado;

    public function __construct($args = [])
    {
        $this->id = $args['id'] ?? null;
        $this->fecha = $args['fecha'] ?? '';
        $this->hora = $args['hora'] ?? '';
        $this->usuarioId = $args['usuarioId'] ?? '';
        $this->estado = $args['estado'] ?? '0';

    }

    public function existecita(){
        $query = "SELECT * FROM " . self::$tabla . " WHERE fecha = '" . $this->fecha . "' AND hora = '" . $this->hora ." LIMIT 1";
        $resultado = self::$db->query($query);
        if($resultado->num_rows) {
            self::$alertas['error'][] = 'La cita ya existe';
        }
        return $resultado;
    }

}