base:
  '*':
    - common.node
    - common.postgres
    - common.redis

  'dev':
    - dev.nginx
    - dev.postgres

  'prod':
    - prod.nginx
