##
# Configure datahub-factory (add user to run it)
class datahub_factory::config inherits datahub_factory {

    user {'datahub-factory':
        ensure => present,
        home   => '/var/lib/datahub-factory',
        shell  => '/bin/false',
        system => true,
    }

    file {'/var/lib/datahub-factory':
        ensure => directory,
        owner  => 'datahub-factory',
        group  => 'root',
    }

}