{% set sites = pillar.get('uwsgi', {}).get('sites', []) %}

include:
  - python

uwsgi:
  pkg:
    - installed
  pip:
    - installed
    - require:
      - pkg: python

set new version of uwsgi:
  cmd.run:
    - user: root
    - name: >
              cd /usr/bin/ &&
              mv uwsgi uwsgi-old &&
              ln -s /usr/local/bin/uwsgi uwsgi
    - require:
      - pkg: uwsgi

{% for site in sites %}
/etc/uwsgi/apps-enabled/{{site['name']}}.ini:
  file.managed:
    - source: salt://wsgiserver/uwsgi/app.jinja2
    - template: jinja
    - context:
        _env: {{ site['env'] }}
        _socket: {{ site['socket'] }}
        base_dir: {{ site['base_dir'] }}
    - watch_in:
      - service: uwsgi
    - require.pkg: uwsgi
{% endfor %}