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

  # This section covers ACL management in the ``pg_hba.conf`` file.
  # acls list controls: which hosts are allowed to connect, how clients
  # are authenticated, which PostgreSQL user names they can use, which
  # databases they can access. Records take one of these forms:
  #
  #acls:
  #  - ['local', 'DATABASE',  'USER',  'METHOD']
  #  - ['host', 'DATABASE',  'USER',  'ADDRESS', 'METHOD']
  #  - ['hostssl', 'DATABASE', 'USER', 'ADDRESS', 'METHOD']
  #  - ['hostnossl', 'DATABASE', 'USER', 'ADDRESS', 'METHOD']
  #
  # The uppercase items must be replaced by actual values.
  # METHOD could be omitted, 'md5' will be appended by default.
  #
  # If ``acls`` item value is empty ('', [], null), then the contents of
  # ``pg_hba.conf`` file will not be touched at all.
  acls:
    - ['host', 'sdev_backend', 'sdev_user', '127.0.0.1/32', 'md5']
    - ['host', 'sdev_backend', 'sdev_user', '::1/128', 'md5']

  # Backup extension for configuration files, defaults to ``.bak``.
  # Set ``False`` to stop creation of backups when config files change.
  {%- if salt['status.time']|default(none) is callable %}
  config_backup: ".backup@{{ salt['status.time']('%y-%m-%d_%H:%M:%S') }}"
  {%- endif %}

  # PostgreSQL service name
  service: postgresql

  users:
    sdev_user:
      ensure: present
      password: '18ruj923h4rx'
      createdb: False
      createroles: False
      createuser: False
      inherit: True
      replication: False

  # databases to be created
  databases:
    sdev_backend:
      owner: 'sdev_user'
      template: 'template0'
      lc_ctype: 'en_US.UTF-8'
      lc_collate: 'en_US.UTF-8'
