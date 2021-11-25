redis-dep-pkg-install:
  pkg.installed:
    - pkgs:
      - systemd-devel
      - tcl-devel
      - gcc
      - gcc-c++
      - make

unzip-redis:
  archive.extracted:
    - name: /usr/src
    - source: salt://modules/database/redis/files/redis-6.2.6.tar.gz
    - if_missing: /usr/src/redis-6.2.6


redis-compile:
  cmd.run:
    - name: cd /usr/src/redis-6.2.6;make
    - unless: test -f /usr/bin/redis-server
    - require:
      - archive: unzip-redis

provide-program-file:
  file.managed:
    - mode: '0755'
    - names:
      - /usr/bin/redis-sentinel:
        - source: /usr/src/redis-6.2.6/src/redis-sentinel
      - /usr/bin/redis-server:
        - source: /usr/src/redis-6.2.6/src/redis-server
      - /usr/bin/redis-benchmark:
        - source: /usr/src/redis-6.2.6/src/redis-benchmark
      - /usr/bin/redis-check-aof:
        - source: /usr/src/redis-6.2.6/src/redis-check-aof
      - /usr/bin/redis-check-rdb:
        - source: /usr/src/redis-6.2.6/src/redis-check-rdb
      - /usr/bin/redis-cli:
        - source: /usr/src/redis-6.2.6/src/redis-cli








