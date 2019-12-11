# Hello world WebApp in Node with Docker

* Create a Dockerfile in the root of this project
* Paste this content inside:
    ```
    FROM node:13.3.0-alpine3.10
    RUN mkdir /app
    WORKDIR /app
    ENV PORT 8080
    
    COPY node/ .
    
    RUN npm install
    
    CMD ["node", "app.js"]
    ```
* Run the following commands in the terminal:
    * `docker build -t hello-world-node .`
    * `docker run -p 8082:8080 -it hello-world-node`

