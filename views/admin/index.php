<?php include_once __DIR__ . '/../templates/barra.php'?>

<h1 class="nombre-pagina">Administracion</h1>

<h2>Buscar citas</h2>
<div class="busqueda">
    <form class="formulario">
        <div class="campo">
            <label for="fecha">Fecha</label>
            <input type="date" id="fecha" name="fecha" value="<?php echo $fecha; ?>">
        </div>

    </form>
</div>

<?php if(count($citas) === 0){
    echo "<h2>No hay citas en esta fecha</h2>";
} ?>

<div class="citas-admin">
    <ul class="citas">
        <?php 
            $idCita = 0;
            foreach($citas as $key => $cita): 
            if($idCita !== $cita->id):
                $total = 0;
        ?>
            <li>
                <p>ID: <span><?php echo $cita->id; ?></span></p>
                <p>Hora: <span><?php echo $cita->hora; ?></span></p>
                <p>Cliente: <span><?php echo $cita->cliente; ?></span></p>
                <p>E-mail: <span><?php echo $cita->email; ?></span></p>
                <p>Telefono: <span><?php echo $cita->telefono; ?></span></p>
                <?php if($cita->estado){ ?>
                    <p class="atendido">Ya fue atendido</p>
                <?php } else {?>
                    <p class="noatendido">En espera</p>
                <?php } ?>
                <h3>Servicios</h3>
                <?php $idCita = $cita->id;
                    endif; 
                    $total += $cita->precio;
                ?>
                <p class="servicio"><?php echo $cita->servicio . " " . $cita->precio ; ?></p>
                <?php
                    $actual = $cita->id;
                    $proximo = $citas[$key + 1]->id ?? 0;

                    if(esUltimo($actual, $proximo)){?>
                    <p class="total">Total: <span>$<?php echo $total; ?></span></p>

                    <?php if(!$cita->estado){ ?>
                        <div class="acciones-cita">
                            <a href="cita/actualizar?id=<?php echo $cita->id;?>" class="boton-actualizar">Reagendar cita</a>
                            <form action="/api/atendido" method="POST">
                                <input type="hidden" name="id" value="<?php echo $cita->id; ?>">
                                <input type="submit" class="boton-atender" value="Atendido">
                            </form>
                        </div>
                    <?php }?>
                        <!--
                    <form action="/api/eliminar" method="POST">
                        <input type="hidden" name="id" value="<?php //echo $cita->id; ?>">
                        <input type="submit" class="boton-eliminar" value="Eliminar">
                    </form>-->
                <?php } ?>
            
        <?php endforeach ?>
    </ul>
</div>

<?php 
    $script = "<script src='build/js/buscador.js'></script> ";

?>