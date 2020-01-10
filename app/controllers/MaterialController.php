<?php

namespace app\controllers;

use app\models\Breadcrumbs;
use app\models\Material;

class MaterialController extends AppController {

    public function viewAction(){
        $alias = $this->route['alias'];
        $material = \R::findOne('material', "alias = ? AND status = '1'", [$alias]);
        if(!$material){
            throw new \Exception('Страница не найдена', 404);
        }

        // хлебные крошки
        $breadcrumbs = Breadcrumbs::getBreadcrumbs($material->category_id, $material->title);

        // связанные материалы
        $related = \R::getAll("SELECT * FROM related_material JOIN material ON material.id = related_material.related_id WHERE related_material.material_id = ?", [$material->id]);

        // запись в куки запрошенного материала
        $p_model = new Material();
        $p_model->setRecentlyViewed($material->id);

        // просмотренные материалы
        $r_viewed = $p_model->getRecentlyViewed();
        $recentlyViewed = null;
        if($r_viewed){
            $recentlyViewed = \R::find('material', 'id IN (' . \R::genSlots($r_viewed) . ') LIMIT 3', $r_viewed);
        }

        // галерея
        $gallery = \R::findAll('gallery', 'material_id = ?', [$material->id]);

        // модификации
        $mods = \R::findAll('modification', 'material_id = ?', [$material->id]);

        $this->setMeta($material->title, $material->description, $material->keywords);
        $this->set(compact('material', 'related', 'gallery', 'recentlyViewed', 'breadcrumbs', 'mods'));
    }

}