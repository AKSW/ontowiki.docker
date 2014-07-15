create with

    docker build -t ontowiki .

run with

    docker run -t -i -p 8080:80 ontowiki

or

    docker run -b -p 8080:80 ontowiki

Run as a user, which is in the docker group or with `sudo`.
