# Moodle Docker Compose

## Usage

#### Pull Image 

- [Moodle Image](https://hub.docker.com/repository/docker/adji21/dockermoodle)
```sh
docker pull adji21/dockermoodle:latest
```

- [Mysql Image Version 5.7 ](https://hub.docker.com/layers/mysql/library/mysql/5.7/images/sha256-ec6742af6625f76f98162b17fd62d22e1824d13fd80f214ab9184c7b6b50bad5?context=explore)
```sh
docker pull mysql:5.7
```

#### Clone Repository

```
git clone https://github.com/santoadji21/docker-moodle.git

or  with github cli 

gh repo clone santoadji21/docker-moodle

cd docker-moodle

docker-compose up 
```

#### Configuration Instalation Moodle 

- Directory <br/>
  ```
  Web address       : http://your-web-address
  
  Moodle directory  : /var/www/html/moodle
  
  Data directory    : /var/www/html/moodledata
  ```
  ![alt text](https://github.com/santoadji21/docker-moodle/blob/master/screenshot/directory.PNG?raw=true)

- Choose database driver mysql <br/>

  ![alt text](https://github.com/santoadji21/docker-moodle/blob/master/screenshot/mysqldriver.PNG?raw=true)

- Database Setting <br/>
  ```
  Database host : docker-moodle_db_1
  #database host use container name from mysql service, in this case container names = docker-moodle_db_1
  
  Database name and user you can see in file docker-compose.yml
  
  db:
      image: 'mysql:5.7'
      volumes:
        - 'db_data:/var/lib/mysql'
      restart: always
      environment:
        MYSQL_ROOT_PASSWORD: r00t
        MYSQL_DATABASE: moodle
        MYSQL_USER: moodle          #Database User
        MYSQL_PASSWORD: r00t        #Database Password
      networks:
        - moodle
  ```
  ![alt text](https://github.com/santoadji21/docker-moodle/blob/master/screenshot/databaseconfig.PNG?raw=true)

## Referensi

- [Install Docker on Ubuntu 18.04 ](https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-18-04)
- [Install Docker Compose on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-18-04)
- [Build and Push Docker Image ](http://blog.shippable.com/build-a-docker-image-and-push-it-to-docker-hub)
- [Docker Compose Manual](https://docs.docker.com/compose/)