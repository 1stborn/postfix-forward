# postfix-forward

## BUILD ##
docker build .

## START ##
docker run -d -p 25:25 -e HOST=mail.somehost.net -e DOMAINS=somehost.net --name postfix postfix:latest
