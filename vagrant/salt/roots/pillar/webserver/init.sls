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

ssh:
  ssh_known_hosts: kafti.net
  fingerprint: 2a:f2:ef:2d:b7:8f:d9:06:97:3d:d8:f0:41:80:02:ea
  key: |
    -----BEGIN RSA PRIVATE KEY-----
    MIIEogIBAAKCAQEA4nIsXdrwG+qzF33UwJtm9CFWoaUd73FjR7nPhJHj+3HNO5jv
    vPUFxWupKUXvy+g6FInli848KLbZST0XHt83P6ub/vJIQjHGMGqoM6t+ncTMun6x
    A8kIpz1LqkxDc5TWBgSo6Tdw9bljgVkideM38J+9HUnDm3yn017DHi1M82ST005M
    xmVRToZL8fOYR95f82seTV6PvGeMpRI1AA1NqrjGkl7ycygO2ClbJFZRY3YtzGIM
    z8cUlxOzr+gZaM1vCDE+pQi1J6m6Wv/sdxPnyxNjM45Yp7iFqeWcIuLG4W5DLLUZ
    LVNqmqs0CO3quG7JjH4P1Ovd90gQubsRq+ShUQIDAQABAoIBABfoI+T4w1a/LY8y
    Wq7G+VSW3HWOYB2yY9/jrxP47w/R0PAU0mKpn6VbG23fE1T8vH0EnfZnnJRT0ZbY
    20MIH+YZ8Qs2ewh6Bsl/yShDV8fCSjb6Pyf+Jmq5nu5oxMpEEWBrR4Xvs35Nx0KV
    rXyys2o1Axs/eWZF/9Xh8EmUUMZ1SfSK1uZlrqBTgUZx4w0ZEb3mr8ZucAPKxANQ
    G03nKUkqInaDRhhyK3LHaoUZ16OhVWrrlWOvFgHsivP7kdp57egjnVzo2aTkxzXC
    Y0nlMtelvbBbYGN2p8YrjBqqKGNLXxxZ58JcCTgjP35TqAcUSxRUdLqFXRoq+nW2
    RlzCpW0CgYEA/28PQh4Goi3XLr8DvOXcz8ZRRfwJCz+L81N+CvYNuzKkIVXWDRfp
    HJIBOvCSGSu/TvIqHPm3Chnc48yWMAAHxEwicUyrqNdMAjQYfnvWOlHaLnBhQwOJ
    Tu66hlZbUJ+JexUTxiwnDiCLKHrH8SYX/W8xMUwqF+VMaDRMVoSI+tsCgYEA4vKq
    SXllV9hrRYfFXPS0dkcPDZe8ggAQ/xoAQQ1sDEJz5WghRk4/zSDdvt/NEnXpX4cL
    HnIb91wnM+pUnmjRMlXh+iHa7+hhtiJUuXyvM7ax9dKQxVI6kFm8jqsuzx0Wh/IA
    QtNzC8ZKPQCelJKWD4qms7n/++KL7vFevpfpDkMCgYAV6XsPmu/Kvc/1zKEPdVCJ
    6mNSc5p7AoqI5yKq4gyvgFqgGXLxUJnIv6WnXrfJvPz+UrvWHH3dOfa+++/uUjJY
    Xoed3IvlQgLdNYbcYtcvzZG/5hgR3Z3LzaLmn0XaFrV+f4Jgv6ziA1ysrku0niX0
    sbMwnW4G+r6hOctKqLfvfQKBgHhVDJ9qo6aBVNeIFsij4y+3m66sXsJbQKfSZIIZ
    mMmjToo7vTDm+oNMQucbCUQZiwUguG+LN3LfxNWNERLxJsLWsLwMyWZdQ7nr2BqF
    luwHmbJq1GIbqHuzaPwInggpNzIbybGlJiH/IIvZ0Tubwb852AwBuk4XH/Uwu/i4
    2VS7AoGASmtqAtPZRn2a/XJczWXZbRXiqvtaJ6zMT4EPDgTKLO57sL7r9g8ODW2V
    OS1HKAdCNlNSz/Sc2bG4hZ4IB7jZVMQZDbx4I31sgTsrc0gYiCRRrxxE39FtAqsF
    7PzaVvCNFQhp4baz/fConJY+AS1dfAfT+qC+AZzj4V0S/Nr2IXU=
    -----END RSA PRIVATE KEY-----

git:
  repository: gitosis@kafti.net:anyticket.git
  base_path: /srv/anyticket
