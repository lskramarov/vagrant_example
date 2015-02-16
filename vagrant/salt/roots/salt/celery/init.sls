{% set pip = pillar.get('pip', {}) %}

include:
    - rabbitmq-server

python:
  pkg.installed:
    - names:
      - python-dev
      - python-pip
  pip.installed:
    - upgrade: True
#  вместо req.pip можно перечислить пакеты
    - names:
      - celery
#    - requirements: {{ pip['requirements'] }}
    - require:
      - pkg: python

/var/log/celery:
  file.directory:
    - user: www-data
    - group: www-data
    - mode: 775
    - makedirs: True

