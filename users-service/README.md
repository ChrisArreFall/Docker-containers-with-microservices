ruby
Manejo de usuarios y clientes del sistema

users-service, al hacer un login correcto que
retorne un token de sesión, este token se guarda del lado del cliente y se utiliza en el header de Authorization para que el servicio de catálogo y órdenes puedan ser consumidos.