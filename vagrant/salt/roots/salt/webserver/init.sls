{% set conf = pillar.get('nginx', {}) %}

nginx:
  pkgrepo:
    - managed
    - name: deb http://nginx.org/packages/debian/ precise nginx
    - key_url: http://nginx.org/keys/nginx_signing.key
  pkg:
    - installed
    - require:
      - pkgrepo: nginx
  service:
    - running

/var/log/nginx:
  file.directory:
    - user: www-data
    - group: www-data
    - mode: 775
    - makedirs: True

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://webserver/nginx.jinja2
    - user: www-data
    - group: www-data
    - mode: 755
    - require:
      - pkg: nginx

{% for site in conf['sites']%}
  {% if site['ssl'] %}

/etc/nginx/ssl:
  file.directory:
    - user: www-data
    - group: www-data
    - mode: 755
    - makedirs: True
    - require:
      - pkg: nginx

/etc/nginx/ssl/{{site['name']}}.cert:
  file.managed:
    - source: salt://webserver/cert.jinja2
    - template: jinja
    - context:
        cert: {{ site['cert'] }}
    - user: www-data
    - group: www-data
    - mode: 664
    - require:
      - file: /etc/nginx/ssl

/etc/nginx/ssl/{{site['name']}}.key:
  file.managed:
    - source: salt://webserver/key.jinja2
    - template: jinja
    - context:
        key: {{ site['key'] }}
    - user: www-data
    - group: www-data
    - mode: 660
    - require:
      - file: /etc/nginx/ssl

  {% endif %}

/etc/nginx/conf.d/{{site['name']}}.conf:
  file.managed:
    - source: salt://webserver/app.jinja2
    - context:
        name: {{ site['name'] }}
        dns_name: {{ site['dns_name'] }}
        uwsgi_pass: {{ site['uwsgi_pass'] }}
        base_dir: {{ site['base_dir'] }}
        ssl: {{ site['ssl'] }}
    - template: jinja
    - makedirs: True
    - watch_in:
      - service: nginx

{% endfor %}