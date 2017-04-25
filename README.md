Vagrant salt masterless proof of concept
----------------------------------------

# Provision vagrant

* `vagrant up`, runs the salt highstate if running the first time.
* `vagrant provision`, re-runs ths salt highstate every time.

# Debug

* `salt-call --id dev --local -l debug state.apply`
* `salt-call pillar.get --id dev  nginx:hostname`