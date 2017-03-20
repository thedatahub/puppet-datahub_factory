##
# Pipeline defined type
define datahub_factory::types::pipeline (
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

    file {"/etc/datahub-factory/pipelines/${pipeline_name}":
        ensure  => file,
        content => epp(
            'datahub_factory/pipeline.ini.epp',
            {
                importer_plugin  => $importer_plugin,
                fixer_plugin     => $fixer_plugin,
                exporter_plugin  => $exporter_plugin,
                fixer_id_path    => $fixer_id_path,
                importer_options => $importer_options,
                fixer_options    => $fixer_options,
                exporter_options => $exporter_options,
            }
        )
    }

    if $setup_cron == true {
        cron {"datahub-factory_${pipeline_name}":
            command => "/usr/local/bin/dhconveyor --pipeline /etc/datahub-factory/pipelines/${pipeline_name}",
            user    => 'datahub-factory',
            *       => $cron_frequency,
        }
    }

}