nginx_install:
    pkg.installed:
        - pkgs:
            - nginx

nginx_service:
    service.running:
        - name: nginx
        - enable: true
        - require:
            - pkg: nginx_install
