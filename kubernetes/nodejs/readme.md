Para configurar el servicio de nodejs.

Establecer el namespace del proyecto:

    kubectl create -f namespace.yml

Configurar el replication controller:

    kubectl create -f nodejs-rc.yml

Configurar el service:

    kubectl create -f nodejs-svc.yml

Configurar el ingress:

    kubectl create -f nodejs-ingress.yml