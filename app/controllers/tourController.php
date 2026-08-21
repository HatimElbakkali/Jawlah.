<?php

require_once __DIR__ . '/../models/tourModel.php';

class tourController
{
    private tourModel $tourModel;

    public function __construct()
    {
        $this->tourModel = new tourModel();
    }

    public function showDesertActivity()
    {
        $DesertActivities = $this->tourModel->getDesertActivity();
        $desertActivitiesPacks = $this->tourModel->getDesertActivitiesPack();
        require __DIR__ . '/../views/tour/tour.php';
    }
}
