    environment:
      - MYSQL_HOST=mysql
      - APACHE_SERVER_NAME=alpine.docker.localhost
      - PHP_SHORT_OPEN_TAG=On
      - PHP_ERROR_REPORTING=E_ALL
      - PHP_DISPLAY_ERRORS=On
      - PHP_HTML_ERRORS=On
      - PHP_XDEBUG_ENABLED=true
      - APP_DEBUG=true
    read_only: false
    privileged: true


    healthcheck:
      interval: 5s
      retries: 3
      start_period: 45s
      test:
      - show databases
      timeout: 2s



