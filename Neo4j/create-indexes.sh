until cypher-shell -u neo4j -p password 'CREATE CONSTRAINT ON (c:Client) ASSERT p.id IS UNIQUE;'
do
  echo "create page index failed, sleeping"
  sleep 10
done

until cypher-shell -u neo4j -p password `LOAD CSV WITH HEADERS FROM 'file:///sql-data/CLIENTE.csv' AS line CREATE (product:Product {id: TOINT(line.ProductID) }) SET product.name = line.ProductName, product.unit_price = TOFLOAT(line.UnitPrice) RETURN product;`
do
  echo "failed to get csv, sleeping"
  sleep 10
done
