postgres:
  # Set True to configure upstream postgresql.org repository for YUM or APT
  use_upstream_repo: True
  # Version to install from upstream repository
  version: '9.6'

  # These are Debian/Ubuntu specific package names
  pkg: 'postgresql-9.6'
  pkg_client: 'postgresql-client-9.6'

  # Additional packages to install with PostgreSQL server,
  # this should be in a list format
  pkgs_extra:
    - postgresql-contrib-9.6
    - postgresql-plpython-9.6

  # Append the lines under this item to your postgresql.conf file.
  # Pay attention to indent exactly with 4 spaces for all lines.
  postgresconf: |
    listen_addresses = '*'  # listen on all interfaces

  # Path to the `pg_hba.conf` file Jinja template on Salt Fileserver
  pg_hba.conf: salt://postgres/templates/pg_hba.conf.j2

  # Backup extension for configuration files, defaults to ``.bak``.
  # Set ``False`` to stop creation of backups when config files change.
  {%- if salt['status.time']|default(none) is callable %}
  config_backup: ".backup@{{ salt['status.time']('%y-%m-%d_%H:%M:%S') }}"
  {%- endif %}

  # PostgreSQL service name
  service: postgresql
