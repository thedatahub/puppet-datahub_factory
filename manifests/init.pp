##
# Install/Configure https://thedatahub.github.io/Datahub-Factory/
# Expose a defined type datahub_factory::pipeline that can be used to create
# pipelines (https://thedatahub.github.io/Datahub-Factory/pipeline)
class datahub_factory () {
    include datahub_factory::install
    include datahub_factory::config
}