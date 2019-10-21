Va a contener los datos de orders-service y users-service. Los datos deben estar dentro de la misma base datos.
Al igual que Neo4j debe ser configurada como servicio y vivir como parte del cluster, no se puede utilizar ningún servicio en la nube para esto.



docker build -t sql-service
docker run -d -p 3306:3306 --name sql-service -e MYSQL_ROOT_PASSWORD=tec sql-service
docker exec -it sql-service bash
mysql -uroot -p
show databases;
use restaurant-rdb;


https://medium.com/better-programming/customize-your-mysql-database-in-docker-723ffd59d8fb