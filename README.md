<div align="center"><h2>AdminSystem</h2></div>

### About

A **SpringBoot + Vue** Administration System that implements basic functions such as adding, deleting, modifying, and querying MySQL Database forms. 😄



### Tech Stack

| Frontend Stack      | Description                         |
| ------------------- | ----------------------------------- |
| `Vue`               | `Frontend framework`                |
| `Vuex`              | `Global State Management Framework` |
| `ElementUI`         | `Frontend UI Framework`             |
| `Axios`             | `Frontend HTTP Framework`           |
| `vue-element-admin` | `Project Template`                  |



| Backend Stack  | Description                 |
| -------------- | --------------------------- |
| `SpringBoot`   | `Container + MVC Framework` |
| `MyBatis`      | `ORM Framework`             |
| `MyBatis-plus` | `MyBatis Enhancement Tool`  |
| `Redis`        | `Non-relational Database`   |



### Quick Start

```shell
git clone https://github.com/Tsumugii24/AdminSystem
cd AdminSystem
```

#### 1. MySQL

```mysql
mysqlsh # open mysql shell
\sql
\connect root@localhost:3306 # password:123456
show databases;
source xdb.sql # create example mysql data
\exit
```

#### 2. Redis

- start `redis` with `Scoop`

```shell
$scoop update
$scoop install redis
$cd C:\Users\<your_user_name>\scoop\apps\redis\7.0.15
$redis-server
```

![image-20240315205953935](https://cdn.jsdelivr.net/gh/Tsumugii24/Typora-images@main/images/2024%2F03%2F15%2F58db8ee5921598e258abbeda76f1ccea-image-20240315205953935-cc3d72.png)

- or start `redis` with `Docker` **(optional)**

```
$docker run -p 6379:6379 -it redis/redis-stack:latest
```

#### 3. SpringBoot (Backend)

```shell
$scoop install openjdk8-redhat
$cd AdminSystemBackend
$cd ./src/main/java/com/tsumugii/
```

&emsp;then `Run XAdminApplication.java`

![image-20240315040656080](https://cdn.jsdelivr.net/gh/Tsumugii24/Typora-images@main/images/2024%2F03%2F15%2Fb3d817ae68abd5a6edaee9a4f19e7837-image-20240315040656080-46f32f.png)

#### 4. Vue (Frontend)

```shell
$scoop install nodejs
$node --version # v16.12.0
$npm --version # 8.1.0
$cd AdminSystemFrontend
$npm install
$npm run dev # localhost:1260
```

![image-20240315040754368](https://cdn.jsdelivr.net/gh/Tsumugii24/Typora-images@main/images/2024%2F03%2F15%2F6fc19ba73107e701a42f9787468a1b5f-image-20240315040754368-60d506.png)

&emsp;Now that if everything runs smoothly, you can open the `url` and enter  **Administrator System**.



### Demonstration

#### Login page

![image-20240315041439748](https://cdn.jsdelivr.net/gh/Tsumugii24/Typora-images@main/images/2024%2F03%2F15%2Ffef8b4764d0d19dfd74af7c4a55fe3bd-image-20240315041439748-d065ae.png)

#### Homepage

![image-20240315041737154](https://cdn.jsdelivr.net/gh/Tsumugii24/Typora-images@main/images/2024%2F03%2F15%2Fe7bbd8f84b3ce7bd5b8c7e46872f5725-image-20240315041737154-36c743.png)

#### Data Management

![image-20240315210725128](https://cdn.jsdelivr.net/gh/Tsumugii24/Typora-images@main/images/2024%2F03%2F15%2F8952893a068ac7069612b99029aeb0d0-image-20240315210725128-74280a.png)



### Contact

*Feel free to contact me through GitHub issues or directly send me a mail if you have any questions about the project.* 👻

<div align="center"><h4>Here is my email address 👉 jsf002016@gmail.com</h4></div>
