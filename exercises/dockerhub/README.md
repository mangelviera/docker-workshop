# Deploy the app in Heroku

* Register on [DockerHub](https://hub.docker.com/)
* In the dashboard create a new repository. Use an easy writable name we are going to need it after.
* Use any of the images we used in the previous exercise to push an image to the registry
* On the root folder of the project use the following commands:
  * `docker login` Enter your DockerHub credentials.
  * `docker build -t YOUR_DOCKERHUB_REPOSITORY_URL:TAG_NAME .`
  * `docker push -a YOUR_DOCKERHUB_REPOSITORY_URL:TAG_NAME`
* If everything has worked properly this is what happened:
  * Docker has build an image with a tag with the url of your repository
  * Docker has pushed that image in the DockerHub registry
  * Now the image reference should appear in your Dockerhub repository.
* Now you can use your image from the DockerHub repo as following:
  * `docker run -it YOUR_DOCKERHUB_REPOSITORY_URL:TAG_NAME sh` and you can interact with your freshly uploaded Docker image
  in the DockerHub registry.
