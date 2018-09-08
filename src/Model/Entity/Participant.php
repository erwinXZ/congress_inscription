<?php
namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * Participant Entity
 *
 * @property int $id
 * @property string $name
 * @property string $ci
 * @property string $email
 * @property float $mobile
 * @property string $city
 * @property string $country
 * @property string $occupation
 * @property string $university
 * @property string $career
 * @property string $type
 * @property string $printed
 * @property string $status
 * @property \Cake\I18n\FrozenTime $created
 * @property \Cake\I18n\FrozenTime $modified
 * @property int $created_by
 * @property int $modified_by
 */
class Participant extends Entity
{

    /**
     * Fields that can be mass assigned using newEntity() or patchEntity().
     *
     * Note that when '*' is set to true, this allows all unspecified fields to
     * be mass assigned. For security purposes, it is advised to set '*' to false
     * (or remove it), and explicitly make individual fields accessible as needed.
     *
     * @var array
     */
    protected $_accessible = [
        'name' => true,
        'ci' => true,
        'email' => true,
        'mobile' => true,
        'city' => true,
        'country' => true,
        'occupation' => true,
        'university' => true,
        'career' => true,
        'type' => true,
        'printed' => true,
        'status' => true,
        'created' => true,
        'modified' => true,
        'created_by' => true,
        'modified_by' => true
    ];
}
