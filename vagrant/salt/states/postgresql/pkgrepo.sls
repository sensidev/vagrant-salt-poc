postgresql_pkgrepo:
  pkgrepo.managed:
    - humanname: PostgreSQL APT Repository
    - name: deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main
    - file: /etc/apt/sources.list.d/postgresql.list
    - gpgcheck: 1
    - key_url: https://www.postgresql.org/media/keys/ACCC4CF8.asc
