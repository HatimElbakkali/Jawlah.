<?php

require_once __DIR__ .'/../models/contactModel.php';

class contactController{
    private contactModel $contactModel;

    public function __construct()
    {
        $this->contactModel = new contactModel();
    }

    public function send(){
        $sendContactInfo = $this->contactModel->sendContactInfo();
        header('content-Type: application/json');
        echo json_encode(['success' => $sendContactInfo]);
    }
}

?>
