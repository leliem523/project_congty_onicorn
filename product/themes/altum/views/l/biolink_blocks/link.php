<?php defined('ALTUMCODE') || die() ?>
<style>
    @media screen and (max-width: 200px) {

        #linkItem {
            color: white;
            padding: 5px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: small;
            border-radius: 5% 5% 5% 5%;
            
           

        }
    }
</style>

<div data-biolink-block-id="<?= $data->link->biolink_block_id ?>" class="col-12 my-2">
    <a id="linkItem" href="<?= $data->link->location_url . $data->link->utm_query ?>" data-biolink-block-id="<?= $data->link->biolink_block_id ?>" class="btn btn-block btn-primary link-btn <?= $data->link->design->link_class ?>" style="<?= $data->link->design->link_style ?>">
        <div class="link-btn-image-wrapper <?= $data->link->design->border_class ?>" <?= $data->link->settings->image ? null : 'style="display: none;"' ?>>
            <img src="<?= $data->link->settings->image ? (mb_substr($data->link->settings->image, 0, 4) === "http" ? $data->link->settings->image : UPLOADS_FULL_URL . 'block_thumbnail_images/' . $data->link->settings->image) : null ?>" class="link-btn-image" loading="lazy" />
        </div>

        <?php if ($data->link->settings->icon) : ?>
            <i class="<?= $data->link->settings->icon ?> mr-1"></i>
        <?php endif ?>


        <?= $data->link->settings->name ?>


    </a>
</div>