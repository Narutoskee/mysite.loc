<?php

namespace app\controllers;

use mysite\Cache;

class MainController extends AppController {

    public function indexAction(){
        $banners = \R::find('banner', 'LIMIT 3');
        $hits = \R::find('material', "hit = '1' AND status = '1' LIMIT 8");
        $this->setMeta('Главная страница', 'Описание...', 'Ключевики...');
        $this->set(compact('banners', 'hits'));
    }

}