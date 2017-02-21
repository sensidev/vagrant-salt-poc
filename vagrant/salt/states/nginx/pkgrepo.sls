nginx_pkgrepo:
  pkgrepo.managed:
    - humanname: Nginx
    - name: deb http://nginx.org/packages/ubuntu/ xenial nginx
    - file: /etc/apt/sources.list.d/nginx.list
    - gpgcheck: 1
    - keyid: ABF5BD827BD9BF62
    - keyserver: keyserver.ubuntu.com
