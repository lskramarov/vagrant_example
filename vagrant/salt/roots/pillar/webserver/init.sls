#nginx:
#  sites: [
#    {'name': 'app_1', 'base_dir': '/srv/anyticket', 'uwsgi_pass': '127.0.0.1:8000',
#    'dns_name': 'dev_1.my-app.com', 'ssl': False, 'cert': '', 'key': ''},
#
#    {'name': 'app_2', 'base_dir': '/srv/anyticket', 'uwsgi_pass': '127.0.0.1:8001',
#    'dns_name': 'dev_2.my-app.com', 'ssl': False, 'cert': '', 'key': ''}
#  ]

nginx:
  sites:
    [{'name': 'app_1', 'base_dir': '/srv/anyticket', 'uwsgi_pass': '127.0.0.1:8000',
      'dns_name': 'dev_1.my-app.com', 'ssl': False, 'cert': '', 'key': ''},

      {'name': 'app_2', 'base_dir': '/srv/anyticket', 'uwsgi_pass': '127.0.0.1:8001',
      'dns_name': 'dev_2.my-app.com', 'ssl': False, 'cert': '', 'key': ''}]
  srv_conf: {'worker_processes': '4'}