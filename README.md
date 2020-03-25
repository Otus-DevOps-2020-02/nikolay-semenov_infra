# nikolay-semenov_infra
testapp_IP = 34.89.160.139

testapp_port = 9292

## Задание: способы управления ресурсами в GCP

### В рамках задания, было поставлены следующие задачи:

1. Развернуть инстанс;

2. Установить mongodb, ruby, задеплоить тестовое приложение

3. Настроить правила firewall

4. Подготовить startup скрипт для запуска инстанса с уже установленными зависимостями и приложением

5. Создать firewall правило используя клиент gcloud

### Решение поставленных задач:
1, 3, 4 Развернуть инстанс, настроить правила firewall, создать правило используя клиент gcloud

Комманда для разворачивания инстанса, а так же добавления необходимых fw-правил:

gcloud compute instances create reddit-app \
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure

gcloud compute firewall-rules create allow-all-icmp \
  --allow ICMP \
  --network default \
  --direction ingress \
  --priority 1000

gcloud compute firewall-rules create allow-all-ssh \
  --allow TCP:22 \
  --network default \
  --direction ingress \
  --priority 1000

gcloud compute firewall-rules create allow-all-puma-server \
  --allow TCP:9292 \
  --network defaut \
  --direction ingress \
  --priority 1000

2. Установить mongodb, ruby, задеплоить тестовое приложение

Установка описана в install_mongodb.sh, install_ruby.sh, deploy.sh. Как запустить:

cd /path/to/script.sh &&

sudo ./script.sh

4. Подготовить startup скрипт для запуска инстанса с уже установленными зависимостями и приложением:

В startup.sh описаны необходимые действия для установки. Добавление скрипта в метаданные выглядит так:

gcloud compute instances create reddit-app \
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata-from-file startup-script=/path/to/startup/script
