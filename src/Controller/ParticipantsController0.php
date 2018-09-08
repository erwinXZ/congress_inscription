<?php
namespace App\Controller;

use App\Controller\AppController;
use Cake\Core\Configure;

/**
 * Participants Controller
 *
 * @property \App\Model\Table\ParticipantsTable $Participants
 *
 * @method \App\Model\Entity\Participant[]|\Cake\Datasource\ResultSetInterface paginate($object = null, array $settings = [])
 */
class ParticipantsController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Http\Response|void
     */
    public function index()
    {
        $participants = $this->paginate($this->Participants);
        $this->set(compact('participants'));
    }

    /**
     * View method
     *
     * @param string|null $id Participant id.
     * @return \Cake\Http\Response|void
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $participant = $this->Participants->get($id, [
            'contain' => []
        ]);

        $this->set('participant', $participant);
    }

    /**
     * Add method
     *
     * @return \Cake\Http\Response|null Redirects on successful add, renders view otherwise.
     */
     public function add()
     {
         $participant = $this->Participants->newEntity();
         if ($this->request->is('post')) {
             $participant = $this->Participants->patchEntity($participant, $this->request->getData());
             $participant->created_by = 1;
             $participant->name = mb_strtoupper($participant->name);
             if ($this->Participants->save($participant)) {
                 $this->Flash->success(__('The participant has been saved.'));

                 return $this->redirect(['action' => 'index']);
             }
             $this->Flash->error(__('The participant could not be saved. Please, try again.'));
         }
         $this->set(compact('participant'));
     }

     /**
      * Edit method
      *
      * @param string|null $id Participant id.
      * @return \Cake\Http\Response|null Redirects on successful edit, renders view otherwise.
      * @throws \Cake\Network\Exception\NotFoundException When record not found.
      */
     public function edit($id = null)
     {
         $participant = $this->Participants->get($id, [
             'contain' => []
         ]);
         if ($this->request->is(['patch', 'post', 'put'])) {
             $participant = $this->Participants->patchEntity($participant, $this->request->getData());
             $participant->modified_by = 1;
             $participant->name = mb_strtoupper($participant->name);
             if ($this->Participants->save($participant)) {
                 $this->Flash->success(__('The participant has been saved.'));

                 return $this->redirect(['action' => 'index']);
             }
             $this->Flash->error(__('The participant could not be saved. Please, try again.'));
         }
         $this->set(compact('participant'));
     }

    /**
     * Delete method
     *
     * @param string|null $id Participant id.
     * @return \Cake\Http\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $participant = $this->Participants->get($id);
        if ($this->Participants->delete($participant)) {
            $this->Flash->success(__('The participant has been deleted.'));
        } else {
            $this->Flash->error(__('The participant could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }


    public function profile(){
        $id = $this->request->getParam('id');

        $colors = ["primary","danger","success","info","warning"];

        $participant = $this->Participants->find('all', [
            'conditions' => ['id' => $id]
        ])->first();

        $this->set('participant', $participant);
        $this->set('colors', $colors);
    }

    public function credentials ($ids = null) {
        if (empty($ids)) {
            $participants = $this->Participants->find('all', [
                'fields' => ['id', 'name', 'type', 'occupation'],
                'conditions' => [
                    'status' => 'A',
                    'printed' => 'N'
                ],
                'order' => ['id' => 'ASC'],
                'limit' => 9
            ]);
            $participantsList = $this->Participants->find('list', [
                'fields' => ['id'],
                'conditions' => [
                    'status' => 'A',
                    'printed' => 'N'
                ],
                'order' => ['id' => 'ASC'],
                'limit' => 9
            ]);
            $array_ids = $participantsList;
        } else {
            $ids = '0,' . $ids;
            $array_ids = explode(',', $ids);
            $participants = $this->Participants->find('all', [
                'fields' => ['id', 'name', 'type', 'occupation'],
                'conditions' => [
                    'Participants.id IN' => $array_ids,
                    'status' => 'A',
                    'printed' => 'N'
                ],
                'order' => ['id' => 'ASC']
            ]);
        }

        $this->viewBuilder()->layout('ajax');
        $this->response->type('pdf');

        $this->set('participants', $participants);
        $this->render('/Participants/pdf/credentials');

        $this->Participants->updateAll(
            ['printed' => 'Y'],
            ['id IN' => $array_ids]
        );
    }

    public function credentials2 () {
        $this->viewBuilder()->layout('ajax');
        $this->response->type('pdf');
        $this->render('/Participants/pdf/credentials2');
    }


//     public function qrFix () {
//         $participants = $this->Participants->find('all');

//         foreach ($participants as $participant) {
//             $this->Participants->updateAll(
//                 ['qr' => md5(Configure::Read('Security.salt') . $participant->id)],
//                 ['id' => $participant->id]
//             );
//         }
// exit;
//     }
}
