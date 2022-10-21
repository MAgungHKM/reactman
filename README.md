# reactman

High performance PHP [workerman/webman](https://github.com/walkor/webman) with TypeScript [react](https://github.com/facebook/react) as its ui framework and for the bundler, we use the lightning fast [vite](https://github.com/vitejs/vite).

<br>

# Getting Started

Install the required packages & libraries with the following command:
```
$ composer install


$ npm install
// or you could use pnpm
$ pnpm install
```

Run the command below to start the php server:
```
php start.php
```

And finally run this command to start watching changes from react ui:
```
npm run watch
// or you could use pnpm
pnpm watch
```

<br>

# Deploying to Production

### Using Docker

Modify Dockerfile as you see fit.<br>
Run the following command to create docker image:
```
docker build --tag <your-project-name> .
```
Run the next command to run the image:
```
docker run --name <your-project-name> --publish <your-host-port>:<APP_PORT> --tty --detach <your-project-name> tail -f /dev/null && docker exec <your-project-name> php /app/start.php start -d
```
<caption>*Not really the best way to use docker container because we are missing docker healthcheck, but this is the only way to use production mode AFAIK.</caption>