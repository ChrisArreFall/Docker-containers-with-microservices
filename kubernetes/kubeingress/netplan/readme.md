Copiar `network-interface.yml` a `/etc/netplan/`.

Aplicar configuracion de red:

    sudo netplan generate

    sudo netplan apply

Para ingress-controller en kubernetes:

    https://kubernetes.github.io/ingress-nginx/deploy/

Mandatory command:

    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static mandatory.yaml

Usando NodePort:

    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/baremetal/service-nodeport.yaml