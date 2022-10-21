# reactman

High performance PHP [**workerman/webman**](https://github.com/walkor/webman) with TypeScript [**react**](https://github.com/facebook/react) as its ui framework, and for the bundler, we use the lightning fast [**vite**](https://github.com/vitejs/vite).

### Versions

This boilerplate uses **PHP**  `^7.2`, **Webman** `1.4.9`, **Node.js** `^16`, **TypeScript** `4.8.4`, **React** `18.2.0`, **React Router** `6.4.2`, **Vite** `3.1.8`

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
$ php start.php
```

And finally run this command to start watching changes from react ui:
```
$ npm run watch
// or you could use pnpm
$ pnpm watch
```

<br>

# Project Structure

```
.
├── app             # Webman Main Folder with your usual MVC pattern
│   ├── controller   
│   ├── middleware   
│   ├── model        
│   └── view         
│       └── www     # Bundled version of React from "views" directory and also the actual "public" path
├── config          # Configuration for Webman
├── node_modules    # Installed NPM packages
├── process         # Webman boilerplate
├── public          # Temporary "public" directory, will be processed later by vite
├── runtime         # Webman boilerplate
├── support         # Webman boilerplate
├── vendor          # Installed Composer packages
└── views           # React Main Folder, edit your UI here
```

<br>

# Deploying to Production

### Using Docker

Modify Dockerfile as you see fit.<br>
Run the following command to create docker image while passing everything in `.env` as build-arg:
```
$ docker build --tag <your-project-name> \
    $(for i in `cat .env`; do out+="--build-arg $i " ; done; echo $out;out="") \
    .
```
Run the next command to run the image:
```
$ docker run --name <your-project-name> \
    --publish <your-host-port>:80 \
    --tty \
    --detach \
    <your-project-name>
```
###### *Not really the best way to use docker container because we are missing docker healthcheck, but this is the only way to use production mode AFAIK.
