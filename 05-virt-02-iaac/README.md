# Домашнее задание к занятию "2. Применение принципов IaaC в работе с виртуальными машинами" - Блех Юлия


## Как сдавать задания

Обязательными к выполнению являются задачи без указания звездочки. Их выполнение необходимо для получения зачета и диплома о профессиональной переподготовке.

Задачи со звездочкой (*) являются дополнительными задачами и/или задачами повышенной сложности. Они не являются обязательными к выполнению, но помогут вам глубже понять тему.

Домашнее задание выполните в файле readme.md в github репозитории. В личном кабинете отправьте на проверку ссылку на .md-файл в вашем репозитории.

Любые вопросы по решению задач задавайте в чате учебной группы.

---

## Важно!

Перед отправкой работы на проверку удаляйте неиспользуемые ресурсы.
Это важно для того, чтоб предупредить неконтролируемый расход средств, полученных в результате использования промокода.

Подробные рекомендации [здесь](https://github.com/netology-code/virt-homeworks/blob/virt-11/r/README.md)

---

## Задача 1

- Опишите своими словами основные преимущества применения на практике IaaC паттернов.
Основные преимущества IaC:
-Скорость и уменьшение затрат: IaC позволяет быстрее конфигурировать инфраструктуру. Это освобождает дорогостоящие ресурсы для выполнения других важных задач.  
-Масштабируемость и стандартизация: IaC предоставляет стабильные среды быстро и на должном уровне. Командам разработчиков не нужно прибегать к ручной настройке.   -Развертывания инфраструктуры с помощью IaC повторяемы и предотвращают проблемы во время выполнения, вызванных дрейфом конфигурации или отсутствием зависимостей.  
-Безопасность и документация: Поскольку код можно версионировать, IaC позволяет документировать, регистрировать и отслеживать каждое изменение конфигурации вашего сервера.  
-Восстановление в аварийных ситуациях: IaC — чрезвычайно эффективный способ отслеживания вашей инфраструктуры и повторного развертывания последнего работоспособного состояния после сбоя или катастрофы любого рода. 

- Какой из принципов IaaC является основополагающим?  
Основополагающим принципом  IaaC является идемпотентность. Это помогает проектировать более надежные системы. Операция считается идемпотентной, если ее многократное выполнение приводит к тому же результату, что и однократное выполнение.

## Задача 2

- Чем Ansible выгодно отличается от других систем управление конфигурациями?  
Ansible отличается простотой использования, имеет безагентную архитектуру (не требует установки агента/клиента на целевую систему) и YAML-подобный файл конфигурации, легко расширяется за счет модулей. 
- Какой, на ваш взгляд, метод работы систем конфигурации более надёжный push или pull?
На мой взгляд более надежным является режим push, т.к. выполнение всех этапов выполнения плэйбука, применение конфигураций и их порядок выполнения контролирует администратор. В режиме pull конфигурации применяются самими серверами, здесь существует вероятность недоставки конфигураций, установка "не в том порядке". 

## Задача 3

Установить на личный компьютер:
- VirtualBox
- Vagrant
- Ansible
Приложить вывод команд установленных версий каждой из программ, оформленный в markdown.
![version](https://github.com/juls-blekh/-virt-homeworks/blob/main/img/Version_vbox_ansible_vagrant.png)

## Задача 4 (*)

Воспроизвести практическую часть лекции самостоятельно.
Хотелось бы воспроизвести, но ошибка:  
Страница https://vagrantcloud.com/bento/ubuntu-20.04 в вашем регионе не доступна:  
![version](https://github.com/juls-blekh/-virt-homeworks/blob/main/img/Vagrant_err.png)
- Создать виртуальную машину.
- Зайти внутрь ВМ, убедиться, что Docker установлен с помощью команды

`docker ps`
