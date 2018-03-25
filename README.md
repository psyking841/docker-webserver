To run server:

`
docker run --name span-webserver -p 7080:7080 --link mongo-container -d -e MONGO_HOST=127.0.0.1 -e MONGO_USER=span -e MONGO_PASS=abc123 webserver-image
`

To run with bash mode

`
docker run --name span-webserver -p 7080:7080 --link mongo-container -e MONGO_HOST=127.0.0.1 -e MONGO_USER=span -e MONGO_PASS=abc123 -it span/webserver /bin/bash
`

Docker compose command:

`
docker-compose -f docker-compose-webserver.yml up -d
`

Do memember to change the MONGO_HOST to the host name of mongo db!


