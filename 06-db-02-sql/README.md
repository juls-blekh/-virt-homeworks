# Домашнее задание к занятию 2. «SQL»

## Введение

Перед выполнением задания вы можете ознакомиться с 
[дополнительными материалами](https://github.com/netology-code/virt-homeworks/blob/virt-11/additional/README.md).

## Задача 1

Используя Docker, поднимите инстанс PostgreSQL (версию 12) c 2 volume, 
в который будут складываться данные БД и бэкапы.

Приведите получившуюся команду или docker-compose-манифест.
```
version: "12"

volumes:
  postgresql_data:  
  backup_postgresql_data:

services:
  
  postgresql:
    image: postgres:12-bullseye 
    container_name: postgresql
    environment:
      - PGDATA=/var/lib/postgresql/data/
      - POSTGRES_PASSWORD=p@passWord
    volumes:
      - postgresql_data:/var/lib/postgresql/data
      - backup_postgresql_data:/backup
```

## Задача 2

В БД из задачи 1: 

- создайте пользователя test-admin-user и БД test_db;
- в БД test_db создайте таблицу orders и clients (спeцификация таблиц ниже);
- предоставьте привилегии на все операции пользователю test-admin-user на таблицы БД test_db;
- создайте пользователя test-simple-user;
- предоставьте пользователю test-simple-user права на SELECT/INSERT/UPDATE/DELETE этих таблиц БД test_db.

Таблица orders:

- id (serial primary key);
- наименование (string);
- цена (integer).

Таблица clients:

- id (serial primary key);
- фамилия (string);
- страна проживания (string, index);
- заказ (foreign key orders).

Приведите:

- итоговый список БД после выполнения пунктов выше;
- описание таблиц (describe);
- SQL-запрос для выдачи списка пользователей с правами над таблицами test_db;
- список пользователей с правами над таблицами test_db.  
![list](https://github.com/juls-blekh/-virt-homeworks/blob/main/06-db-02-sql/img/2.1-%20list%20db.png)  
![list](https://github.com/juls-blekh/-virt-homeworks/blob/main/06-db-02-sql/img/2.2-tables.png)   
![list](https://github.com/juls-blekh/-virt-homeworks/blob/main/06-db-02-sql/img/2.3-select.png)
## Задача 3

Используя SQL-синтаксис, наполните таблицы следующими тестовыми данными:

Таблица orders

|Наименование|цена|
|------------|----|
|Шоколад| 10 |
|Принтер| 3000 |
|Книга| 500 |
|Монитор| 7000|
|Гитара| 4000|

Таблица clients

|ФИО|Страна проживания|
|------------|----|
|Иванов Иван Иванович| USA |
|Петров Петр Петрович| Canada |
|Иоганн Себастьян Бах| Japan |
|Ронни Джеймс Дио| Russia|
|Ritchie Blackmore| Russia|

Используя SQL-синтаксис:
- вычислите количество записей для каждой таблицы.

Приведите в ответе:

    - запросы,
    - результаты их выполнения.
![list](https://github.com/juls-blekh/-virt-homeworks/blob/main/06-db-02-sql/img/3-insert.png)
## Задача 4

Часть пользователей из таблицы clients решили оформить заказы из таблицы orders.

Используя foreign keys, свяжите записи из таблиц, согласно таблице:

|ФИО|Заказ|
|------------|----|
|Иванов Иван Иванович| Книга |
|Петров Петр Петрович| Монитор |
|Иоганн Себастьян Бах| Гитара |

Приведите SQL-запросы для выполнения этих операций.

Приведите SQL-запрос для выдачи всех пользователей, которые совершили заказ, а также вывод этого запроса.
 
Подсказка: используйте директиву `UPDATE`.  
![list](https://github.com/juls-blekh/-virt-homeworks/blob/main/06-db-02-sql/img/4-update.png)

## Задача 5

Получите полную информацию по выполнению запроса выдачи всех пользователей из задачи 4 
(используя директиву EXPLAIN).

Приведите получившийся результат и объясните, что значат полученные значения.  
![list](https://github.com/juls-blekh/-virt-homeworks/blob/main/06-db-02-sql/img/5-explain.png)  
EXPLAIN - план выполнения запроса, в данном случае SELECT. Результат - оценка стоимости выполнения запроса; ожидаемое число строк, которое должен вывести этот узел плана; ожидаемый средний размер строк, выводимых этим узлом плана (в байтах). Используется для оптимизации БД.

## Задача 6

Создайте бэкап БД test_db и поместите его в volume, предназначенный для бэкапов (см. задачу 1).    
```
pg_dumpall > /backup/db.out
```
Остановите контейнер с PostgreSQL, но не удаляйте volumes.     
```
docker-compose down
```
(volume postgresql_data все-таки надо удалить (при восстановлении бэкапа выходит сообщение, что БД уже существует)  
```
docker volume rm postgresql_data
```

Поднимите новый пустой контейнер с PostgreSQL.   
```
docker-compose up
```
Восстановите БД test_db в новом контейнере.  
![list](https://github.com/juls-blekh/-virt-homeworks/blob/main/06-db-02-sql/img/6.1_backup.png)    
![list](https://github.com/juls-blekh/-virt-homeworks/blob/main/06-db-02-sql/img/6-tables.png) 

Приведите список операций, который вы применяли для бэкапа данных и восстановления. 
