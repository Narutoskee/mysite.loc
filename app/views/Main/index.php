<!--banner-starts-->
<div class="bnr" id="home">
    <div  id="top" class="callbacks_container">
        <ul class="rslides" id="slider4">
            <li>
                <img src="images/bnr-1.jpg" alt=""/>
            </li>
            <li>
                <img src="images/bnr-2.jpg" alt=""/>
            </li>
            <li>
                <img src="images/bnr-3.jpg" alt=""/>
            </li>
        </ul>
    </div>
    <div class="clearfix"> </div>
</div>
<!--banner-ends-->

<!--about-starts-->
<?php if($banners): ?>
<div class="about">
    <div class="container">
        <div class="about-top grid-1">
            <?php foreach($banners as $banner): ?>
                <div class="col-md-4 about-left">
                <figure class="effect-bubba">
                    <img class="img-responsive" src="images/<?=$banner->img;?>" alt=""/>
                    <figcaption>
                        <h2><?=$banner->title;?></h2>
                        <p><?=$banner->description;?></p>
                    </figcaption>
                </figure>
            </div>
            <?php endforeach; ?>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<?php endif; ?>
<!--about-end-->
<!--material-starts-->
<?php if($hits): ?>
<?php $curr = \mysite\App::$app->getProperty('currency'); ?>
<div class="material">
    <div class="container">
        <div class="material-top">
            <div class="material-one">
            <?php foreach($hits as $hit): ?>
                <div class="col-md-3 material-left">
                    <div class="material-main simpleCart_shelfItem">
                        <a href="material/<?=$hit->alias;?>" class="mask"><img class="img-responsive zoom-img" src="images/<?=$hit->img;?>" alt="" /></a>
                        <div class="material-bottom">
                            <h3><a href="material/<?=$hit->alias;?>"><?=$hit->title;?></a></h3>
                            <p>  <a href="material/<?=$hit->alias;?>">Почитать подробнее...</a></p>

<!--                            <h4>-->
<!--                                <a data-id="--><?//=$hit->id;?><!--" class="add-to-cart-link" href="cart/add?id=--><?//=$hit->id;?><!--"><i></i></a> <span class=" item_price">--><?//=$curr['symbol_left'];?><!----><?//=$hit->price * $curr['value'];?><!----><?//=$curr['symbol_right'];?><!--</span>-->
<!--                            --><?php //if($hit->old_price): ?>
<!--                                <small><del>--><?//=$curr['symbol_left'];?><!----><?//=$hit->old_price * $curr['value'];?><!----><?//=$curr['symbol_right'];?><!--</del></small>-->
<!--                            --><?php //endif; ?>
<!--                            </h4>-->
                        </div>
                        <div class="srch">
                            <span>-50%</span>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<?php endif; ?>
<!--material-end-->
