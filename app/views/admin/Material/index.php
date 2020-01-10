<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Список материалов
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?=ADMIN;?>"><i class="fa fa-dashboard"></i> Главная</a></li>
        <li class="active">Список материалов</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Категория</th>
                                <th>Наименование</th>
<!--                                <th>Цена</th>-->
                                <th>Статус</th>
                                <th>Действия</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach($materials as $material): ?>
                                <tr>
                                    <td><?=$material['id'];?></td>
                                    <td><?=$material['cat'];?></td>
                                    <td><?=$material['title'];?></td>
<!--                                    <td>--><?//=$material['price'];?><!--</td>-->
                                    <td><?=$material['status'] ? 'On' : 'Off';?></td>
                                    <td><a href="<?=ADMIN;?>/material/edit?id=<?=$material['id'];?>"><i class="fa fa-fw fa-eye"></i></a> <a class="delete" href="<?=ADMIN;?>/material/delete?id=<?=$material['id'];?>"><i class="fa fa-fw fa-close text-danger"></i></a></td>
                                </tr>
                            <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                    <div class="text-center">
                        <p>(<?=count($materials);?> материалов из <?=$count;?>)</p>
                        <?php if($pagination->countPages > 1): ?>
                            <?=$pagination;?>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>
<!-- /.content -->