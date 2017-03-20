##
# Publicly exposed Pipeline defined type
define datahub_factory::pipeline (
    String $fixer_id_path,
    Hash $importer_options,
    Hash $fixer_options,
    Hash $exporter_options,
    String $pipeline_name = $title,
    String $importer_plugin = 'Adlib',
    String $fixer_plugin = 'Fix',
    String $exporter_plugin = 'Datahub',
    Boolean $setup_cron = true,
    Hash $cron_frequency = {
        hour   => 2,
        minute => 0,
    },
) {

    datahub_factory::types::pipeline {$pipeline_name:
        fixer_id_path    => $fixer_id_path,
        importer_options => $importer_options,
        fixer_options    => $fixer_options,
        exporter_options => $exporter_options,
        importer_plugin  => $importer_plugin,
        fixer_plugin     => $fixer_plugin,
        exporter_plugin  => $exporter_plugin,
        setup_cron       => $setup_cron,
        cron_frequency   => $cron_frequency,
    }

}