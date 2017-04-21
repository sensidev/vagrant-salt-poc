project-folder:
  file.directory:
    - name: /www/backend.sensidev.com/
    - makedirs: True
    - user:  www-data
    - group:  www-data
    - mode: 755
    - recurse:
      - user
      - group
      - mode
