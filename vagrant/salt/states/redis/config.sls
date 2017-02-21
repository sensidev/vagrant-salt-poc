include:
    - redis.service

redis_config_etc:
    file.managed:
        - name: /etc/redis/redis.conf
        - makedirs: true
        - template: jinja
        - source: salt://redis/templates/redis.conf.jinja
        - watch_in:
            - service: redis_service

redis_config_service:
    file.managed:
        - name: /etc/systemd/system/redis.service
        - makedirs: true
        - template: jinja
        - source: salt://redis/templates/redis.service.jinja

redis_config_var:
    file.directory:
        - name: /var/lib/redis
        - user: redis
        - group: redis
        - dir_mode: 770

redis_config_logs:
    file.managed:
        - name: /var/log/redis/redis.log
        - makedirs: true
        - user: redis
        - group: redis
