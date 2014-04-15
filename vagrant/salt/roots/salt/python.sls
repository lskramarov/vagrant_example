{% set pip = pillar.get('pip', {}) %}

python:
  pkg.installed:
    - names:
      - python-dev
      - libxml2-dev
      - libxslt1-dev
      - unixodbc-dev
      - python-pip
  pip.installed:
    - upgrade: True
#  вместо req.pip можно перечислить пакеты
#    - names:
#      - Django==1.6.2
    - requirements: {{ pip['requirements'] }}
    - require:
      - pkg: python
