<?php

namespace app\controllers;

class SearchController extends AppController{

    public function typeaheadAction(){
        if($this->isAjax()){
            $query = !empty(trim($_GET['query'])) ? trim($_GET['query']) : null;
            if($query){
                $materials = \R::getAll("SELECT id, title FROM material WHERE title LIKE ? AND status = '1' LIMIT 11", ["%{$query}%"]);
                echo json_encode($materials);
            }
        }
        die;
    }

    public function indexAction(){
        $query = !empty(trim($_GET['s'])) ? trim($_GET['s']) : null;
        if($query){
            $materials = \R::find('material', "title LIKE ? AND status = '1'", ["%{$query}%"]);
        }
        $this->setMeta('Поиск по: ' . h($query));
        $this->set(compact('materials', 'query'));
    }

}