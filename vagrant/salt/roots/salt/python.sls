python:
  pkg:
    - installed
    - names:
      - python2.7-dev
      - python-pip
  pip:
    - installed
    - names:
      - Django==1.5.4
    - require:
      - pkg: python