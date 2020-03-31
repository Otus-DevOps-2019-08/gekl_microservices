# Выполнено Занятие (logging-1)

## gekl_microservices [![Build Status](https://travis-ci.com/Otus-DevOps-2019-08/gekl_microservices.svg?branch=logging-1)](https://travis-ci.com/Otus-DevOps-2019-08/gekl_microservices.svg?branch=logging-1)


Выполнены основнные пункты ДЗ:
  Сбор не структурированных логов
  
  Визуализация логов
  
  Сбор структурированных логов
  
  Распределенная трасировка

# Выполнено Занятие (monitoring-2)

## gekl_microservices [![Build Status](https://travis-ci.com/Otus-DevOps-2019-08/gekl_microservices.svg?branch=monitoring-2)](https://travis-ci.com/Otus-DevOps-2019-08/gekl_microservices.svg?branch=monitoring-2)


Выполнены основнные пункты ДЗ:
  Push контейнеры в docker hub https://hub.docker.com/u/gklepach/


# Выполнено Занятие (monitoring-1)

## gekl_microservices [![Build Status](https://travis-ci.com/Otus-DevOps-2019-08/gekl_microservices.svg?branch=monitoring-1)](https://travis-ci.com/Otus-DevOps-2019-08/gekl_microservices.svg?branch=monitoring-1)


Выполнены основнные пункты ДЗ:

Prometheus: запуск, конфигурация, знакомство с Web UI

Мониторинг состояния микросервисов

Сбор метрик хоста с использованием экспортера

Задание со * №1
  Использовал эспортер MongoDB от компании percona  
Задание со * №2
  https://hub.docker.com/r/prom/blackbox-exporter
  
Push контейнеры в docker hub https://hub.docker.com/u/gklepach/


# Выполнено Занятие (gitlab-ci-1)

## gekl_microservices [![Build Status](https://travis-ci.com/Otus-DevOps-2019-08/gekl_microservices.svg?branch=gitlab-ci-1)](https://travis-ci.com/Otus-DevOps-2019-08/gekl_microservices.svg?branch=gitlab-ci-1)


Выполнены основнные пункты ДЗ

Выполнен задание со *

На основании описания в статье 

https://docs.gitlab.com/ee/ci/docker/using_docker_build.html#use-docker-in-docker-executor

Запустил gitlab-runner на docker-host, а он в свою очередь запустился контейнер с reddit.

# Выполнено Занятие (DOCKER-4)
## gekl_microservices [![Build Status](https://travis-ci.com/Otus-DevOps-2019-08/gekl_microservices.svg?branch=docker-4)](https://travis-ci.com/Otus-DevOps-2019-08/gekl_microservices.svg?branch=docker-4)

Типы сетей в Docker:

    none - только loobback, сеть изолирована
    host - использует сеть хоста
    bridge - отдельные namespaces сети ("виртуальная" сеть)
    MacVlan - на основе сабинтерфейсов Linux, поддерка 802.1Q
    Overlay - несколько Docker хостов в одну сеть, работает поверх VXLAN

При запуске контейнера можно указать только одну сеть параметром --network=<name>. Для подключения дополнительных сетей к контейнерам применить команду: docker network connect. Также несколько сетей могут быть подключены к контейнеру при запуске, если используется docker-compose.

# docker-compose.yml

```
version: '3.3'
services:
  post_db:
    image: mongo:${MONGO_VERSION}
    volumes:
      - post_db:/data/db
    networks:
      - reddit
  ui:
    build: ./ui
    image: ${USERNAME}/ui:${UI_VERSION}
    ports:
      - ${UI_PORT}:${REDDIT_PORT}/tcp
    networks:
      - ui
  post:
    build: ./post-py
    image: ${USERNAME}/post:${POST_VERSION}
    networks:
      - reddit
      - ui
  comment:
    build: ./comment
    image: ${USERNAME}/comment:${COMMENT_VERSION}
    networks:
      - reddit
      - ui
volumes:
  post_db:
networks:
  reddit:
  ui:
```

Переменные заданы в .env

```
# .env

COMPOSE_PROJECT_NAME=project
MONGO_VERSION=3.2
USERNAME=some_user
UI_VERSION=1.0
POST_VERSION=1.0
COMMENT_VERSION=1.0
UI_PORT=9292
REDDIT_PORT=9292
```

## Задание со *
`docker-compose.ovveride.yml` позволяет перезаписывать параметры `docker-compose.yml`. Для использования модифицированного кода приложений без пересборки образа можно использовать `volumes`. Для перезаписи команды запуска контейнера используется параметр `entrypoint`.
```
# docker-compose.ovveride.yml

version: '3.3'
services:
  ui:
    volumes:
      - ui:/app
    entrypoint: 
      - puma
      - --debug 
      - -w 2
  post:
    volumes:
      - post-py:/app
  comment:
    volumes:
      - comment:/app
    entrypoint: 
      - puma
      - --debug 
      - -w 2

volumes:
  ui:
  post-py:
  comment:
```

# Выполнено Занятие (DOCKER-3)
## gekl_microservices [![Build Status](https://travis-ci.com/Otus-DevOps-2019-08/gekl_microservices.svg?branch=docker-2)](https://travis-ci.com/Otus-DevOps-2019-08/gekl_microservices.svg?branch=docker-2)

###Выполнено###
Приложение запущено как микросервис в GCP
*Изменены network-alias
Улучшили образы изменением докер файла
*Пересобрали с Alpine
Подключили папку с базой, перезапустили контейнеры, все работает. УРА!


# Выполнено Занятие (DOCKER-2)
## gekl_microservices [![Build Status](https://travis-ci.com/Otus-DevOps-2019-08/gekl_microservices.svg?branch=docker-2)](https://travis-ci.com/Otus-DevOps-2019-08/gekl_microservices.svg?branch=docker-2)

Примеры `docker run`
```
docker run --rm -it ubuntu:16.04 bash
docker run -dt nginx:latest
docker run --rm --pid host -ti tehbilly/htop

# -i - запуск контейнера в foreground (docker attach)
# -d - запуск контейнера в background
# -t - создает TTY
# --rm - удаляет контейнер при выходе из него
# --pid host - запуск контейнера в определенном PID namespace

## DOCKER. GCE ##
- Создан, инициализирован и авторизован новый проект docker в GCP
- В результате получен файл с аутентификационными данными:```

## Docker-контейнеры
`docker-image` - инструмент для создания хостов и установки на них `docker-engine`


Создание:
```
docker-machine create <name>

# Создания инстанса в GCE
docker-machine create --driver google \
 --google-machine-image https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/family/ubuntu-1604-lts \
 --google-machine-type n1-standard-1 \
 --google-zone europe-west1-b \
 docker-host
```
При создании инстанса в GCE с помощью `docker-machine` используется переменная окружения `GOOGLE_PROJECT` для указания управляемого проекта. 

Для подключения к инстансу выполнить следующие команды:
```
docker-machine env <instance_name>
eval "$(docker-machine env <instance_name>)"
```

PR checklist

    [*] Выставил label с номером домашнего задания
    [*] Выставил label с темой домашнего задания
