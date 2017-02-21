include:
    - nginx.install

nginx_default_conf:
    file.absent:
        - name: /etc/nginx/conf.d/default.conf
        - watch_in:
            - service: nginx_service

nginx_vagrant_conf:
    file.managed:
        - name: /etc/nginx/conf.d/vagrant.conf
        - template: jinja
        - source: salt://nginx/templates/vagrant.conf.jinja
        - watch_in:
            - service: nginx_service