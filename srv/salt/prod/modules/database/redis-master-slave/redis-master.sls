include:
  - modules.database.redis-master-slave.install 

provide-file:
  file.managed:
    - names: 
      - /etc/redis.conf:
        - source: salt://modules/database/redis-master-slave/files/redis.conf.j2
        - template: jinja
      - /usr/lib/systemd/system/redis_server.service:
        - source: salt://modules/database/redis-master-slave/files/redis_server.service

redis_server.service:
  service.running:
    - enable: true
    - reload: true
    - watch:
      - file: provide-file







