<?php
namespace App\Test\Fixture;

use Cake\TestSuite\Fixture\TestFixture;

/**
 * ParticipantsFixture
 *
 */
class ParticipantsFixture extends TestFixture
{

    /**
     * Fields
     *
     * @var array
     */
    // @codingStandardsIgnoreStart
    public $fields = [
        'id' => ['type' => 'integer', 'length' => 10, 'autoIncrement' => true, 'default' => null, 'null' => false, 'comment' => null, 'precision' => null, 'unsigned' => null],
        'name' => ['type' => 'string', 'length' => 180, 'default' => null, 'null' => false, 'collate' => null, 'comment' => null, 'precision' => null, 'fixed' => null],
        'ci' => ['type' => 'string', 'length' => 15, 'default' => null, 'null' => false, 'collate' => null, 'comment' => null, 'precision' => null, 'fixed' => null],
        'email' => ['type' => 'string', 'length' => 90, 'default' => null, 'null' => false, 'collate' => null, 'comment' => null, 'precision' => null, 'fixed' => null],
        'mobile' => ['type' => 'decimal', 'length' => 8, 'default' => null, 'null' => true, 'comment' => null, 'precision' => null, 'unsigned' => null],
        'city' => ['type' => 'string', 'length' => 60, 'default' => null, 'null' => true, 'collate' => null, 'comment' => null, 'precision' => null, 'fixed' => null],
        'country' => ['type' => 'string', 'length' => 30, 'default' => null, 'null' => true, 'collate' => null, 'comment' => null, 'precision' => null, 'fixed' => null],
        'occupation' => ['type' => 'string', 'length' => 180, 'default' => null, 'null' => true, 'collate' => null, 'comment' => null, 'precision' => null, 'fixed' => null],
        'university' => ['type' => 'string', 'length' => 180, 'default' => null, 'null' => true, 'collate' => null, 'comment' => null, 'precision' => null, 'fixed' => null],
        'career' => ['type' => 'string', 'length' => 180, 'default' => null, 'null' => true, 'collate' => null, 'comment' => null, 'precision' => null, 'fixed' => null],
        'type' => ['type' => 'string', 'fixed' => true, 'length' => 1, 'default' => 'P', 'null' => true, 'collate' => null, 'comment' => null, 'precision' => null],
        'printed' => ['type' => 'string', 'fixed' => true, 'length' => 1, 'default' => 'N', 'null' => true, 'collate' => null, 'comment' => null, 'precision' => null],
        'status' => ['type' => 'string', 'fixed' => true, 'length' => 1, 'default' => 'A', 'null' => true, 'collate' => null, 'comment' => null, 'precision' => null],
        'created' => ['type' => 'timestamp', 'length' => null, 'default' => null, 'null' => false, 'comment' => null, 'precision' => null],
        'modified' => ['type' => 'timestamp', 'length' => null, 'default' => null, 'null' => true, 'comment' => null, 'precision' => null],
        'created_by' => ['type' => 'integer', 'length' => 10, 'default' => null, 'null' => false, 'comment' => null, 'precision' => null, 'unsigned' => null, 'autoIncrement' => null],
        'modified_by' => ['type' => 'integer', 'length' => 10, 'default' => null, 'null' => true, 'comment' => null, 'precision' => null, 'unsigned' => null, 'autoIncrement' => null],
        '_constraints' => [
            'primary' => ['type' => 'primary', 'columns' => ['id'], 'length' => []],
        ],
    ];
    // @codingStandardsIgnoreEnd

    /**
     * Init method
     *
     * @return void
     */
    public function init()
    {
        $this->records = [
            [
                'id' => 1,
                'name' => 'Lorem ipsum dolor sit amet',
                'ci' => 'Lorem ipsum d',
                'email' => 'Lorem ipsum dolor sit amet',
                'mobile' => 1.5,
                'city' => 'Lorem ipsum dolor sit amet',
                'country' => 'Lorem ipsum dolor sit amet',
                'occupation' => 'Lorem ipsum dolor sit amet',
                'university' => 'Lorem ipsum dolor sit amet',
                'career' => 'Lorem ipsum dolor sit amet',
                'type' => 'Lorem ipsum dolor sit ame',
                'printed' => 'Lorem ipsum dolor sit ame',
                'status' => 'Lorem ipsum dolor sit ame',
                'created' => 1536444072,
                'modified' => 1536444072,
                'created_by' => 1,
                'modified_by' => 1
            ],
        ];
        parent::init();
    }
}
