# 5xtraining Backend 作業

 ## Table schema
|tasks      |           |                     |
|-----------|-----------|---------------------|
|id         |`integer`  |primary key          |
|taskid     |`string`   |required, unique     |
|start_time |`datetime` |                     |
|end_time   |`datetime` |                     |
|priority   |`integer`  |required             |
|status     |`integer`  |required             |
|cat        |`string`   |                     |


|users      |          |                      |
|-----------|----------|----------------------|
|id         |`integer` |primary key           |
|uid        |`string`  |required, unique      |
|name       |`string`  |required              |
|username   |`string`  |required, unique      |
|passwd     |`string`  |required              |
|role       |`integer` |required              |

|categories |           |                     |
|-----------|-----------|---------------------|
|id         |`integer`  |primary key          |
|catname    |`string`   |required, unique     |

|user_taskships|          |                      |
|--------------|----------|----------------------|
|id            |`integer` |primary key           |
|user          |`string`  |required              |
|task          |`string`  |required              |

|tags       |          |                      |
|-----------|----------|----------------------|
|id         |`integer` |primary key           |
|tagname    |`string`  |required, unique      |

|tag_taskships    |            |                       |
|-----------------|------------|-----------------------|
|id               |`integer`   |primary key            |
|tag              |`string`    |required               |
|task             |`string`    |required               |


