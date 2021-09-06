<?php defined('ALTUMCODE') || die() ?>
<style>
    @media screen and (max-width: 200px) {

        #vd-link {
           
           
         
            width: 161px;
            
            
           

        }
    }
</style>
<div data-biolink-block-id="<?= $data->link->biolink_block_id ?>" class="col-12 my-2">
    <div id="vd-link" class="embed-responsive embed-responsive-16by9 link-iframe-round">
        <iframe class="embed-responsive-item" scrolling="no" frameborder="no" src="https://www.youtube.com/embed/<?= $data->embed ?>"></iframe>
    </div>
</div>

