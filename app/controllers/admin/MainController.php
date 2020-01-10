<?php

namespace app\controllers\admin;

class MainController extends AppController {

    public function indexAction(){
        $countNewOrders = \R::count('order', "status = '0'");
        $countUsers = \R::count('user');
        $countMaterials = \R::count('material');
        $countCategories = \R::count('category');
        $this->setMeta('Панель управления');
        $this->set(compact('countNewOrders', 'countCategories', 'countMaterials', 'countUsers'));
    }

}