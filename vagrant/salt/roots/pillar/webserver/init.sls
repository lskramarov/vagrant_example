nginx:
  apps: [
    {'app_name': 'app_1', 'base_dir': '/srv/anyticket', 'uwsgi_pass': '127.0.0.1:8000',
    'dns_name': 'dev_1.my-app.com', 'ssl': True},

    {'app_name': 'app_2', 'base_dir': '/srv/anyticket', 'uwsgi_pass': '127.0.0.1:8001',
    'dns_name': 'dev_2.my-app.com', 'ssl': False}
  ]