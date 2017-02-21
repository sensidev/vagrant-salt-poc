redis_archive:
    archive.extracted:
        - name: /var/tmp
        - source: http://download.redis.io/redis-stable.tar.gz
        - source_hash: sha1=3f961b6a4052838c9b8fe8faf61840a6ac66ea89
        - user: redis
        - group: redis
        - if_missing: /var/tmp/redis-stable

redis_make:
    cmd.wait:
        - name: make
        - cwd: /var/tmp/redis-stable
        - runas: root
        - watch:
            - archive: redis_archive

redis_test:
    cmd.wait:
        - name: make test
        - cwd: /var/tmp/redis-stable
        - runas: root
        - watch_in:
            - cmd: redis_install
        - watch:
            - cmd: redis_make

redis_install:
    cmd.wait:
        - name: make install
        - cwd: /var/tmp/redis-stable
        - runas: root
        - creates: /usr/local/bin/redis-server
