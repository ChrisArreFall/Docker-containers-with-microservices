Va a contener los datos del catalog-service, también va a almacenar cuales productos han sido comprados por los clientes para poder a través del catalog-service ofrecer un listado de los productos que son más populares en una sucursal. Esta BD debe ser configurada como servicio y ser parte del cluster de kubernetes. Se debe crear un nodo de Neo4j de cada tipo para las sucursales, servicios, menús, disponibilidad de agendas y sus respectivas relaciones.


docker build -t neo4j-service .
docker run -d -p 7474:7474 -p 7687:7687 --name neo4j-service -v DataVolume:/var/lib/neo4j/import/ neo4j-service 

docker exec -it neo4j-service bash