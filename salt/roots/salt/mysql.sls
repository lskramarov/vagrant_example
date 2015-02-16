mysql-server:
  pkg:
    - installed
    - pkgs:
      - mysql-server
  service:
    - running
    - name: mysql
    - enable: True
    - require:
      - pkg: mysql-server
  mysql_user:
    - present
    - name: root
    - password: root
    - require:
      - service: mysql