<!--start-breadcrumbs-->
<div class="breadcrumbs">
    <div class="container">
        <div class="breadcrumbs-main">
            <ol class="breadcrumb">
                <?=$breadcrumbs;?>
            </ol>
        </div>
    </div>
</div>
<!--end-breadcrumbs-->
<!--prdt-starts-->
<div class="prdt">
    <div class="container">
        <div class="prdt-top">
            <div class="col-md-12 prdt-left">
                <?php if(!empty($materials)): ?>
                    <div class="material-one">
                        <?php $curr = \mysite\App::$app->getProperty('currency'); ?>
                        <?php foreach($materials as $material): ?>
                            <div class="col-md-4 material-left p-left">
                                <div class="material-main simpleCart_shelfItem">
                                    <a href="material/<?=$material->alias;?>" class="mask"><img class="img-responsive zoom-img" src="images/<?=$material->img;?>" alt="" />
                                    <div class="material-bottom">
                                        <h3><?=$material->title;?></h3>
                                        <p>Почитать подробнее...</p>
<!--                                        <h4>-->
<!--                                            <a data-id="--><?//=$material->id;?><!--" class="add-to-cart-link" href="cart/add?id=--><?//=$material->id;?><!--"><i></i></a> <span class=" item_price">--><?//=$curr['symbol_left'];?><!----><?//=$material->price * $curr['value'];?><!----><?//=$curr['symbol_right'];?><!--</span>-->
<!--                                            --><?php //if($material->old_price): ?>
<!--                                                <small><del>--><?//=$curr['symbol_left'];?><!----><?//=$material->old_price * $curr['value'];?><!----><?//=$curr['symbol_right'];?><!--</del></small>-->
<!--                                            --><?php //endif; ?>
<!--                                        </h4>-->
                                    </div></a>
                                    <div class="srch srch1">
                                        <span>-50%</span>
                                    </div>
                                </div>
                            </div>
                        <?php endforeach; ?>
                        <div class="clearfix"></div>
                        <div class="text-center">
                            <p>(<?=count($materials)?> материала(ов) из <?=$total;?>)</p>
                            <?php if($pagination->countPages > 1): ?>
                                <?=$pagination;?>
                            <?php endif; ?>
                        </div>
                    </div>
                <?php else: ?>
                    <h3>В этой категории материалов пока нет...</h3>
                <?php endif; ?>
            </div>
<!--            <div class="col-md-3 prdt-right">-->
<!--                <div class="w_sidebar">-->
<!--                    --><?php //new \app\widgets\filter\Filter(); ?>
<!--                </div>-->
<!--            </div>-->
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--material-end-->