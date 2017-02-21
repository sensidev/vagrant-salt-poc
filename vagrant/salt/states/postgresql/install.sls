postgresql_install:
    pkg.installed:
        - pkgs:
            - libpq-dev
            - postgresql-9.5
            - postgresql-contrib-9.5
            - postgresql-client-9.5

postgresql_service:
    service.running:
        - name: postgresql
        - enable: true
        - require:
            - pkg: postgresql_install
