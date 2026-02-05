
PASSWORD=etuCHONDxyfNE6hs88sR
DB=/opt/lampp/bin/mariadb

setup:
	systemctl start docker

run:
	@ docker run --detach \
  --name mariadb \
  -e MARIADB_ROOT_PASSWORD=$(PASSWORD) \
  -p 3306:3306 \
  mariadb:latest
	
login:
	 @ $(DB) -h 127.0.0.1 -P 3306 -u root -p"$(PASSWORD)"

do:
	 @ $(DB) -h 127.0.0.1 -P 3306 -u root -p"$(PASSWORD)" < run.sql

installtest:
	 @ $(DB) -h 127.0.0.1 -P 3306 -u root -p"$(PASSWORD)" < installtest.sql
test:
	 @ $(DB) -h 127.0.0.1 -P 3306 -u root -p"$(PASSWORD)" < test.sql

stop:
	@ docker stop mariadb
	@ docker rm mariadb



