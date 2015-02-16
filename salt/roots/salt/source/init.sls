{% set ssh = pillar.get('ssh', {}) %}
{% set git = pillar.get('git', {}) %}

git:
  pkg.installed

{{ ssh['ssh_known_hosts'] }}:
  ssh_known_hosts:
    - present
    - user: root
    - fingerprint: {{ ssh['fingerprint'] }}

/root/.ssh/id_rsa:
  file.managed:
    - source: salt://source/id_rsa.jinja2
    - template: jinja
    - user: root
    - group: root
    - mode: 600

#clone repository:
#  cmd:
#    - run
#    - unless: test -d {{ git['base_path'] }}
#    - user: root
#    - name: >
#              git clone {{ git['repository'] }} {{ git['base_path'] }}
#    - require:
#      - pkg: git
#      - file.managed: /root/.ssh/id_rsa
#      - ssh_known_hosts: {{ ssh['ssh_known_hosts'] }}

{{ git['repository'] }}:
  git.latest:
    - rev: {{ git['branch'] }}
    - target: {{ git['base_path'] }}
    - require:
      - pkg: git
      - file.managed: /root/.ssh/id_rsa
      - ssh_known_hosts: {{ ssh['ssh_known_hosts'] }}