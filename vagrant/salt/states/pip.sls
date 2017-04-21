tools:
  pip.installed:
    - requirements: '/home/vagrant/clone/tools_requirements.txt'
    - bin_env: '/usr/bin/pip3'
    - require:
      - pkg: core

requirements:
  virtualenv.managed:
    - name: '/www/backend.sensidev.com/venv'
    - user: www-data
    - system_site_packages: False
    - requirements: '/home/vagrant/clone/requirements.txt'
    - require:
      - file: project-folder
