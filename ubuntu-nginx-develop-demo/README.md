create with

    docker build -t ontowiki-develop .

run with

    docker run -t -i -p 8080:80 ontowiki-develop

or

    docker run -b -p 8080:80 ontowiki-develop

or simply use the provided image on docker hub.

Run as a user, which is in the docker group or with `sudo`.
