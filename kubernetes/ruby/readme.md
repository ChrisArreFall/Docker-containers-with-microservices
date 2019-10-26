Para configurar el servicio de ruby.

Establecer el namespace del proyecto:

    kubectl create -f namespace.yml

Configurar el replication controller:

    kubectl create -f ruby-rc.yml

Configurar el service:

    kubectl create -f ruby-svc.yml

Configurar el ingress:

    kubectl create -f ruby-ingress.yml