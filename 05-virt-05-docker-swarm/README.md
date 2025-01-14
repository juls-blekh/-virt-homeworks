# Домашнее задание к занятию "5. Оркестрация кластером Docker контейнеров на примере Docker Swarm"

---

## Задача 1

Дайте письменые ответы на следующие вопросы:

- В чём отличие режимов работы сервисов в Docker Swarm кластере: replication и global?  
Режим работы сервисов global: сервис запускается на каждой доступной ноде  
Режим работы сервисов replication: менеджер распределяет заданное количество экземпляров сервиса между нодами.
- Какой алгоритм выбора лидера используется в Docker Swarm кластере?  
Выбор лидера в Docker Swarm кластере осуществляется на основе алгоритма Raft. В кластере могут одновременно работать несколько управляющих нод, которые могут в любой момент заменить вышедшего из строя лидера.

- Что такое Overlay Network?  
Overlay Network создает распределенную сеть среди нескольких хостов-демонов Docker, позволяя подключенным к ней контейнерам безопасно обмениваться данными при включенном шифровании. Docker прозрачно обрабатывает маршрутизацию каждого пакета к правильному хосту Docker daemon и правильному контейнеру назначения и обратно. 

## Задача 2

Создать ваш первый Docker Swarm кластер в Яндекс.Облаке

Для получения зачета, вам необходимо предоставить скриншот из терминала (консоли), с выводом команды:
```
docker node ls
```
![result](https://github.com/juls-blekh/-virt-homeworks/blob/main/05-virt-05-docker-swarm/img/05-virt-5.2.png)
![result](https://github.com/juls-blekh/-virt-homeworks/blob/main/05-virt-05-docker-swarm/img/05-virt-5.2.docker-node-ls.png)

## Задача 3

Создать ваш первый, готовый к боевой эксплуатации кластер мониторинга, состоящий из стека микросервисов.

Для получения зачета, вам необходимо предоставить скриншот из терминала (консоли), с выводом команды:
```
docker service ls
```
![result](https://github.com/juls-blekh/-virt-homeworks/blob/main/05-virt-05-docker-swarm/img/05-virt-5.3.docker-service-ls.png)
