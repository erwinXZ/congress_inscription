<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Participant $participant
 */
?>

<div id="formNewParticipant" class="modal-dialog modal-lg">
    <!-- Modal content-->
    <div class="modal-content">
        <?= $this->Form->create($participant, ['id' => 'participant']) ?>
        <div class="modal-header">
            <button type="button" class="close" onclick="$('#modalParticipants').modal('hide')">×</button>
            <h4 class="modal-title">Nuevo Participante</h4>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-md-6">
                    <?php echo $this->Form->input('name', ['label' => 'Nombre']); ?>
                </div>
                <div class="col-md-6">
                    <?php echo $this->Form->input('document', ['label' => 'Documento de identidad']); ?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <?php echo $this->Form->input('type', ['label' => 'Tipo', 'empty' => '- Seleccione -', 'options' => ['S' => 'Estudiante', 'P' => 'Profesional', 'E' => 'Expositor', 'O' => 'Organizador'], 'class' => 'form-control select2', 'style' => 'width: 100%']); ?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <?php echo $this->Form->input('email', ['label' => 'Correo electrónico']); ?>
                </div>
                <div class="col-md-6">
                    <?php echo $this->Form->input('mobile', ['label' => 'Teléfono Móvil']); ?>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-6">
                    <?php echo $this->Form->input('country', ['label' => 'País']); ?>
                </div>
                <div class="col-md-6">
                    <?php echo $this->Form->input('city', ['label' => 'Ciudad']); ?>
                </div>
            </div>
            <?php echo $this->Form->input('occupation', ['label' => 'Título']); ?>
            <div class="row">
                <div class="col-md-6">
                    <?php echo $this->Form->input('university', ['label' => 'Universidad']); ?>
                </div>
                <div class="col-md-6">
                    <?php echo $this->Form->input('career', ['label' => 'Carrera']); ?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label>
                            <input type="checkbox" name="printed" class="icheck" value="Y" <?php echo ($participant->printed == 'Y') ? 'checked' : ''; ?>> Impreso
                        </label>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>
                            <input type="checkbox" name="status" class="icheck" value="A" checked> Activo
                        </label>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="submit" class="btn btn-info"><i class="fa fa-save"></i> Guardar</button>
            <button type="button" class="btn btn-danger" onclick="$('#modalParticipants').modal('hide')"><i class="fa fa-times"></i> Cancelar</button>
        </div>
        <?= $this->Form->end() ?>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#formNewParticipant form').submit(function (e) {
            if ($("#participant").valid()) {
                $.ajax({
                    type: 'POST',
                    url: '<?php echo $this->Url->build(['controller' => 'participants', 'action' => 'add']); ?>',
                    data: $('#formNewParticipant form').serialize(),
                    success: function (response)
                    {
                        if (response.error == 0) {
                            $('#modalParticipants').modal('hide');
                            $('#jqgParticipants').trigger('reloadGrid');
                        } else {
                            alert(response.message);
                        }
                    }
                });
            }
            e.preventDefault();
        });

        $('input[type="checkbox"].icheck, input[type="radio"].icheck').iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass: 'iradio_minimal-blue'
        });
    });
</script>
