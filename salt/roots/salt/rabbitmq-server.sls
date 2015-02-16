rabbitmq-server:
  pkgrepo:
    - managed
    - name: deb http://www.rabbitmq.com/debian/ testing main
    - key_url: http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
  pkg:
    - installed
    - require:
      - pkgrepo: rabbitmq-server
  service:
    - running
    - enable: True
    - require:
      - pkg: rabbitmq-server
