<?php if(!empty($materials)): ?>
    <?php $curr = \mysite\App::$app->getProperty('currency'); ?>
    <?php foreach($materials as $material): ?>
        <div class="col-md-4 material-left p-left">
            <div class="material-main simpleCart_shelfItem">
                <a href="material/<?=$material->alias;?>" class="mask"><img class="img-responsive zoom-img" src="images/<?=$material->img;?>" alt="" /></a>
                <div class="material-bottom">
                    <h3><?=$material->title;?></h3>
                    <p>Почитать подробнее...</p>
<!--                    <h4>-->
<!--                        <a data-id="--><?//=$material->id;?><!--" class="add-to-cart-link" href="cart/add?id=--><?//=$material->id;?><!--"><i></i></a> <span class=" item_price">--><?//=$curr['symbol_left'];?><!----><?//=$material->price * $curr['value'];?><!----><?//=$curr['symbol_right'];?><!--</span>-->
<!--                        --><?php //if($material->old_price): ?>
<!--                            <small><del>--><?//=$curr['symbol_left'];?><!----><?//=$material->old_price * $curr['value'];?><!----><?//=$curr['symbol_right'];?><!--</del></small>-->
<!--                        --><?php //endif; ?>
<!--                    </h4>-->
                </div>
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
<?php else: ?>
    <h3>материалов не найдено...</h3>
<?php endif; ?>
