include:
  - modules.database.redis-master-slave.install


provide-program-conf:
  file.managed:
    - names:
      - /etc/redis.conf:
        - source: salt://modules/database/redis-master-slave/files/redis-slave.conf.j2
        - template: jinja
      - /usr/lib/systemd/system/redis_server.service:
        - source: salt://modules/database/redis-master-slave/files/redis_server.service

redis_server.service:
  service.running:
    - enable: true
    - reload: true
    - watch:
      - file: provide-program-conf







