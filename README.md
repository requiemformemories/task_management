# 5xtraining Backend 作業

 ## Table schema
|Task       |           |                     |
|-----------|-----------|---------------------|
|taskid     |`string`   |primary key, required|
|start_time |`datetime` |                     |
|end_time   |`datetime` |                     |
|priority   |`integer`  |                     |
|status     |`integer`  |required             |
|cat        |`string`   |                     |


|User       |          |                      |
|-----------|----------|----------------------|
|uid        |`string`  |primary key, required |
|name       |`string`  |required              |
|username   |`string`  |required,unique       |
|passwd     |`string`  |required              |
|role       |`integer` |required              |

|Category   |           |                     |
|-----------|-----------|---------------------|
|catid      |`string`  |primary key, required |
|catname    |`string`  |required              |

|User_task_relation|           |                |
|------------------|-----------|----------------|
|utid      |`string`  |primary key, required    |
|user      |`string`  |required                 |
|task      |`string`  |required                 |

|Tag        |          |                      |
|-----------|----------|----------------------|
|tagid      |`string`  |primary key, required |
|tagname    |`string`  |required              |

|tag_task_relation|            |                       |
|-----------------|------------|-----------------------|
|ttid             |`string`  |primary key, required    |
|tag              |`string`  |required                 |
|task             |`string`  |required                 |


