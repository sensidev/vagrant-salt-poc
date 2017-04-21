postgres:
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
