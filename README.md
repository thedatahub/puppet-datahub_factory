# datahub_factory

#### Table of Contents

1. [Description](#description)
2. [Setup](#setup)
    * [What datahub_factory affects](#what-datahub_factory-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with datahub_factory](#beginning-with-datahub_factory)
3. [Usage](#usage)
4. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)

## Description
Install and configure [_Datahub::Factory_](https://thedatahub.github.io/Datahub-Factory/), an application to transfer and convert data from a (museum) Collection Management System to an exchange format ([LIDO](http://network.icom.museum/cidoc/working-groups/lido/what-is-lido/)) or a [Datahub instance](https://github.com/thedatahub/Datahub).

## Setup

### What datahub_factory affects
* This module uses [_meltwater-cpan_](https://forge.puppet.com/meltwater/cpan) to install the _Datahub::Factory_ CPAN package. However, the module is included, not configured. You are free to configure it elsewhere in your manifests without running into errors.

### Beginning with datahub_factory

## Usage
There are two parts to this module, `datahub_factory` to install and configure _Datahub::Factory_ and `datahub_factory::pipeline` to create and manage [pipeline configuration files](https://thedatahub.github.io/Datahub-Factory/pipeline).

`datahub_factory` takes no options:

```
include datahub_factory
```

To create a pipeline configuration file (installed in `/etc/datahub-factory/pipelines`), use the defined type `datahub_factory::pipeline`:

```
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
```

This creates the pipeline `/etc/datahub-factory/pipelines/test.ini` that fetches data from an Adlib data dump (`/tmp/adlib.xml`), uses a Catmandu fix called `/tmp/msk.fix` and submits it to a Datahub instance running at `my.thedatahub.io`. This entire operation is run every night at 2:00 by cron.

## Reference

### Class datahub_factory


#### Parameters


### Under-the-hood classes


## Limitations


## Development

Pull requests welcome at [https://github.com/thedatahub/puppet-datahub_factory](https://github.com/thedatahub/puppet-datahub_factory).

