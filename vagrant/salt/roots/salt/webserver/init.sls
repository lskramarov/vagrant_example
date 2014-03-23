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
    - watch:
      - pkg: nginx
      - file.managed: /etc/nginx/conf.d/*

/var/log/nginx:
    file.directory:
        - user: www-data
        - group: www-data
        - mode: 775
        - makedirs: True

/etc/nginx/ssl:
    file.directory:
        - user: www-data
        - group: www-data
        - mode: 755
        - makedirs: True


{% for app in conf['apps']%}

/etc/nginx/conf.d/{{ app['app_name'] }}.conf:
  file.managed:
    - source: salt://webserver/app.conf
    - context:
        app_name: {{ app['app_name'] }}
        dns_name: {{ app['dns_name'] }}
        uwsgi_pass: {{ app['uwsgi_pass'] }}
        base_dir: {{ app['base_dir'] }}
        ssl: {{ app['ssl'] }}
    - template: jinja
    - makedirs: True
    - watch_in:
      - service: nginx

{% endfor %}