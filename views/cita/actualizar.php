<?php include_once __DIR__ . '/../templates/barra.php'?>

<h1 class="nombre-pagina">Reagendar Cita</h1>

        <?php foreach($errores as $error):?>
            <div class="alerta error">
            <?php echo $error;?>
            </div>
        <?php endforeach?>
        <?php include_once __DIR__ . "/../templates/alertas.php"; ?>
            
        <form class="formulario" method="POST" enctype="multipart/form-data">
            <div class="campo">
                <label for="fecha">Fecha</label>
                <input type="date" id="fecha" min="<?php echo date('Y-m-d'); ?>" name="cita[fecha]" value="<?php echo s($cita->fecha); ?>">
            </div>
            <div class="campo">
                <label for="hora">Hora</label>
                <!--<input type="time" id="hora" name="cita[hora]" value="<?php //echo s($cita->hora); ?>"> -->

                <input type="time" name="cita[hora]" list="listalimitestiempo" id="hora" value="<?php echo s($cita->hora); ?>">

                <datalist id="listalimitestiempo">
                    <option value="09:00">
                    <option value="09:30">
                    <option value="10:00">
                    <option value="10:30">
                    <option value="11:00">
                    <option value="11:30">
                    <option value="12:00">
                    <option value="12:30">
                    <option value="13:00">
                    <option value="13:30">
                    <option value="14:00">
                    <option value="14:30">
                    <option value="15:00">
                    <option value="15:30">
                    <option value="16:00">
                    <option value="16:30">
                    <option value="17:00">
                    <option value="17:30">
                    <option value="18:00">
                    <option value="18:30">
                </datalist>
            </div>

            <input type="hidden" id="id" value="<?php echo $id; ?>">
            <input type="submit" value="Actualizar cita" class="boton ">
        </form>

