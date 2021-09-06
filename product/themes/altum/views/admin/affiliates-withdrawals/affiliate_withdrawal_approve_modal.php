<?php defined('ALTUMCODE') || die() ?>

<div class="modal fade" id="affiliate_withdrawal_approve_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <div class="d-flex justify-content-between mb-3">
                    <h5 class="modal-title">
                        <i class="fa fa-fw fa-sm fa-check text-primary-900 mr-2"></i>
                        <?= language()->admin_affiliate_withdrawal_approve_modal->header ?>
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="<?= language()->global->close ?>">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <p class="text-muted"><?= language()->admin_affiliate_withdrawal_approve_modal->subheader ?></p>

                <div class="mt-4">
                    <a href="" id="affiliate_withdrawal_approve_modal_url" class="btn btn-lg btn-block btn-primary"><?= language()->global->submit ?></a>
                </div>
            </div>

        </div>
    </div>
</div>

<?php ob_start() ?>
<script>
    /* On modal show load new data */
    $('#affiliate_withdrawal_approve_modal').on('show.bs.modal', event => {
        let affiliate_withdrawal_id = $(event.relatedTarget).data('affiliate-withdrawal-id');

        $(event.currentTarget).find('#affiliate_withdrawal_approve_modal_url').attr('href', `${url}admin/affiliates-withdrawals/approve/${affiliate_withdrawal_id}&global_token=${global_token}`);
    });
</script>
<?php \Altum\Event::add_content(ob_get_clean(), 'javascript') ?>
