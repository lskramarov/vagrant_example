git:
  pkg.installed


kafti.net:
  ssh_known_hosts:
    - present
    - user: root
    - fingerprint: 2a:f2:ef:2d:b7:8f:d9:06:97:3d:d8:f0:41:80:02:ea


/root/.ssh/id_rsa:
  file.managed:
    - source: salt://id_rsa
    - user: root
    - group: root
    - mode: 600
    - require:
      - pkg: git


clone repository:
  cmd:
    - run
    - unless: test -d /srv/anyticket
    - user: root
    - name: >
              git clone gitosis@kafti.net:anyticket.git /srv/anyticket
    - require:
      - pkg: git
      - ssh_known_hosts: kafti.net
      - file.managed: /root/.ssh/id_rsa
