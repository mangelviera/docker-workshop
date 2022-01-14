# Deploy the app in Heroku

* Register on [Heroku](https://www.heroku.com/)
* In the dashboard create a new app. Use an easy writable name we are going to need it after.
* Install the [heroku-cli](https://devcenter.heroku.com/articles/heroku-cli)
* Create a `heroku.yml` file on the root of the project with this content:
    ```
    build:
        docker:
            web: Dockerfile
    ```
* On the root folder of the project use the following commands:
    * `heroku login`
    * `heroku container:login`
    * `heroku container:push web --app=APP-NAME`  
    * `heroku container:release web --app=APP-NAME`
    * `heroku open --app=APP-NAME`
* If everything has worked properly this is what happened:
    * Heroku has run the command `docker build -t web .`
    * It has pushed the image to the Heroku Docker Image Registry (or Repository)
    * It has published that image and has run it as a container. (on the container:release command)
    * It has mapped the PORT env variable to the one served by the Heroku system
* And that`s all. Enjoy your app deployed with Docker!