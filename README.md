# Выполнено Занятие (DOCKER-3)
## gekl_infra [![Build Status](https://travis-ci.com/Otus-DevOps-2019-08/gekl_microservices.svg?branch=docker-2)](https://travis-ci.com/Otus-DevOps-2019-08/gekl_microservices.svg?branch=docker-2)

###Выполнено###
Приложение запущено как микросервис в GCP
*Изменены network-alias
Улучшили образы изменением докер файла
*Пересобрали с Alpine
Подключили папку с базой, перезапустили контейнеры, все работает. УРА!


# Выполнено Занятие (DOCKER-2)
## gekl_infra [![Build Status](https://travis-ci.com/Otus-DevOps-2019-08/gekl_microservices.svg?branch=docker-2)](https://travis-ci.com/Otus-DevOps-2019-08/gekl_microservices.svg?branch=docker-2)

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
