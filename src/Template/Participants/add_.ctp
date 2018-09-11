<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Participant $participant
 */
?>
<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('List Participants'), ['action' => 'index']) ?></li>
    </ul>
</nav>
<div class="participants form large-9 medium-8 columns content">
    <?= $this->Form->create($participant) ?>
    <fieldset>
        <legend><?= __('Add Participant') ?></legend>
        <?php
            echo $this->Form->control('name');
            echo $this->Form->control('document');
            echo $this->Form->control('email', ['value' => 'info@rootcode.com.bo']);
            echo $this->Form->control('mobile');
            echo $this->Form->control('city');
            echo $this->Form->control('country');
            echo $this->Form->control('occupation');
            echo $this->Form->control('university');
            echo $this->Form->control('career');
            echo $this->Form->control('type');
            echo $this->Form->control('printed');
            echo $this->Form->control('status');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
