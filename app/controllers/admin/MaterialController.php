<?php

namespace app\controllers\admin;

use app\models\admin\Material;
use app\models\AppModel;
use mysite\App;
use mysite\libs\Pagination;

class MaterialController extends AppController {

    public function indexAction(){
        $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
        $perpage = 10;
        $count = \R::count('material');
        $pagination = new Pagination($page, $perpage, $count);
        $start = $pagination->getStart();
        $materials = \R::getAll("SELECT material.*, category.title AS cat FROM material JOIN category ON category.id = material.category_id ORDER BY material.title LIMIT $start, $perpage");
        $this->setMeta('Список материалов');
        $this->set(compact('materials', 'pagination', 'count'));
    }

    public function addImageAction(){
        if(isset($_GET['upload'])){
            if($_POST['name'] == 'single'){
                $wmax = App::$app->getProperty('img_width');
                $hmax = App::$app->getProperty('img_height');
            }else{
                $wmax = App::$app->getProperty('gallery_width');
                $hmax = App::$app->getProperty('gallery_height');
            }
            $name = $_POST['name'];
            $material = new Material();
            $material->uploadImg($name, $wmax, $hmax);
        }
    }

    public function editAction(){
        if(!empty($_POST)){
            $id = $this->getRequestID(false);
            $material = new Material();
            $data = $_POST;
            $material->load($data);
            $material->attributes['status'] = $material->attributes['status'] ? '1' : '0';
            $material->attributes['hit'] = $material->attributes['hit'] ? '1' : '0';
            $material->getImg();
            if(!$material->validate($data)){
                $material->getErrors();
                redirect();
            }
            if($material->update('material', $id)){
                $material->editFilter($id, $data);
                $material->editRelatedMaterial($id, $data);
                $material->saveGallery($id);
                $alias = AppModel::createAlias('material', 'alias', $data['title'], $id);
                $material = \R::load('material', $id);
                $material->alias = $alias;
                \R::store($material);
                $_SESSION['success'] = 'Изменения сохранены';
                redirect();
            }
        }

        $id = $this->getRequestID();
        $material = \R::load('material', $id);
        App::$app->setProperty('parent_id', $material->category_id);
        $filter = \R::getCol('SELECT attr_id FROM attribute_material WHERE material_id = ?', [$id]);
        $related_material = \R::getAll("SELECT related_material.related_id, material.title FROM related_material JOIN material ON material.id = related_material.related_id WHERE related_material.material_id = ?", [$id]);
        $gallery = \R::getCol('SELECT img FROM gallery WHERE material_id = ?', [$id]);
        $this->setMeta("Редактирование материала {$material->title}");
        $this->set(compact('material', 'filter', 'related_material', 'gallery'));
    }

    public function addAction(){
        if(!empty($_POST)){
            $material = new Material();
            $data = $_POST;
            $material->load($data);
            $material->attributes['status'] = $material->attributes['status'] ? '1' : '0';
            $material->attributes['hit'] = $material->attributes['hit'] ? '1' : '0';
            $material->getImg();

            if(!$material->validate($data)){
                $material->getErrors();
                $_SESSION['form_data'] = $data;
                redirect();
            }

            if($id = $material->save('material')){
                $material->saveGallery($id);
                $alias = AppModel::createAlias('material', 'alias', $data['title'], $id);
                $p = \R::load('material', $id);
                $p->alias = $alias;
                \R::store($p);
                $material->editFilter($id, $data);
                $material->editRelatedMaterial($id, $data);
                $_SESSION['success'] = 'материал добавлен';
            }
            redirect();
        }

        $this->setMeta('Новый материал');
    }

    public function relatedMaterialAction(){
        /*$data = [
            'items' => [
                [
                    'id' => 1,
                    'text' => 'материал 1',
                ],
                [
                    'id' => 2,
                    'text' => 'материал 2',
                ],
            ]
        ];*/

        $q = isset($_GET['q']) ? $_GET['q'] : '';
        $data['items'] = [];
        $materials = \R::getAssoc('SELECT id, title FROM material WHERE title LIKE ? LIMIT 10', ["%{$q}%"]);
        if($materials){
            $i = 0;
            foreach($materials as $id => $title){
                $data['items'][$i]['id'] = $id;
                $data['items'][$i]['text'] = $title;
                $i++;
            }
        }
        echo json_encode($data);
        die;
    }

    public function deleteGalleryAction(){
        $id = isset($_POST['id']) ? $_POST['id'] : null;
        $src = isset($_POST['src']) ? $_POST['src'] : null;
        if(!$id || !$src){
            return;
        }
        if(\R::exec("DELETE FROM gallery WHERE material_id = ? AND img = ?", [$id, $src])){
            @unlink(WWW . "/images/$src");
            exit('1');
        }
        return;
    }

}