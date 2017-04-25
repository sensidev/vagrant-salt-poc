include:
  - nginx.install

nginx_conf_default:
  file.absent:
    - name: /etc/nginx/conf.d/default.conf
    - watch_in:
      - service: nginx_service

nginx_conf_sites_enabled_default:
  file.absent:
    - name: /etc/nginx/sites-enabled/default
    - watch_in:
      - service: nginx_service

nginx_conf_sites_available:
  file.managed:
    - name: /etc/nginx/sites-available/{{ salt['pillar.get']('nginx:hostname') }}.conf
    - template: jinja
    - source: salt://nginx/templates/project.conf.jinja

nginx_conf_sites_enabled:
  file.symlink:
    - name: /etc/nginx/sites-enabled/{{ salt['pillar.get']('nginx:hostname') }}.conf
    - target: /etc/nginx/sites-available/{{ salt['pillar.get']('nginx:hostname') }}.conf
    - require:
      - file: nginx_conf_sites_available
    - watch_in:
      - service: nginx_service