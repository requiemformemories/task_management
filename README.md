# 5xtraining Backend 作業

## Introduction 
根據 [五倍紅寶石 新進工程師訓練教材: 後端](https://github.com/5xRuby/5xtraining/blob/master/backend.md) 所做的任務管理 web app。

## Requirements
- Ruby 2.6.3
- Rails 5.2
- Postgresql 9.6

## Installation

### STEP1: clone it from github
```
git clone git@github.com:requiemformemories/backend-5xtraining.git  
$ cd backend-5xtraining
```
### STEP2: edit database config
```
$ cp database.travis.yml config/database.yml
$ vim config/database.yml #edit the settings
```

### STEP3: install gems and setup database
```
$ bundle install  
$ rails db:create  
$ rails db:migrate  
```

## Table schema
|tasks      |           |                     |
|-----------|-----------|---------------------|
|id         |`integer`  |primary key          |
|taskid     |`string`   |required, unique     |
|start_time |`datetime` |                     |
|end_time   |`datetime` |                     |
|priority   |`integer`  |required             |
|status     |`string`   |required             |
|category_id|`integer`  |                     |


|users          |          |                      |
|---------------|----------|----------------------|
|id             |`integer` |primary key           |
|uid            |`string`  |required, unique      |
|name           |`string`  |required              |
|username       |`string`  |required, unique      |
|password_digest|`string`  |required              |
|role           |`integer` |required              |

|categories |           |                     |
|-----------|-----------|---------------------|
|id         |`integer`  |primary key          |
|catname    |`string`   |required, unique     |

|user_taskships|          |                      |
|--------------|----------|----------------------|
|id            |`integer` |primary key           |
|user_id       |`string`  |required              |
|task_id       |`string`  |required              |

|tags       |          |                      |
|-----------|----------|----------------------|
|id         |`integer` |primary key           |
|tagname    |`string`  |required, unique      |

|tag_taskships    |            |                       |
|-----------------|------------|-----------------------|
|id               |`integer`   |primary key            |
|tag_id           |`string`    |required               |
|task_id          |`string`    |required               |


