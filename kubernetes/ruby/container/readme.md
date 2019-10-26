Para actualizar el archivo Gemfile.lock y poder ejecutar `docker build -t <image-name>`:

    docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.5 bundle install

Generar la imagen:

    docker build -t ochesto/ruby-service

Subir la imagen a `hub.docker.com`:

    docker push ochesto/ruby-service