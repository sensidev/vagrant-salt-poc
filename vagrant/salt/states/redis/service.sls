include:
    - redis.build

redis_service:
    service.running:
        - name: redis
        - enable: true
        - full_restart: true
        - require:
            - redis_install
