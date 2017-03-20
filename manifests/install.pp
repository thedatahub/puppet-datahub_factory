##
# Install required packages (Datahub-Factory)
class datahub_factory::install inherits datahub_factory {

    include '::cpan'

    # Before we can install Datahub::Factory, we have to install some Perl packages
    # otherwise CPAN will fail because it is missing the development headers
    ['libxml-compile-perl'].each | $package | {
        package {$package:
            ensure => installed,
            before => Cpan['Datahub::Factory'],
        }
    }

    cpan {'Datahub::Factory':
        ensure => latest
    }

    file {'/etc/datahub-factory':
        ensure => directory,
    }

    file {'/etc/datahub-factory/pipelines':
        ensure => directory,
    }

}