include datahub_factory

datahub_factory::pipeline {'test.ini':
    fixer_id_path    => 'administrativeMetadata.recordWrap.recordID.0._',
    importer_options => {
        file_name => '/tmp/adlib.xml',
        data_path => 'recordList.record.*',
    },
    fixer_options    => {
        file_name => '/tmp/msk.fix'
    },
    exporter_options => {
        datahub_url         => 'my.thedatahub.io',
        datahub_format      => 'LIDO',
        oauth_client_id     => 'datahub',
        oauth_client_secret => 'datahub',
        oauth_username      => 'datahub',
        oauth_password      => 'datahub',
    },
    importer_plugin  => 'Adlib',
    fixer_plugin     => 'Fix',
    exporter_plugin  => 'Exporter',
    setup_cron       => true,
    cron_frequency   => {
        hour   => 2,
        minute => 0
    },
}