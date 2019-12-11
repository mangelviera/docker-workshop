## Docker from scratch

* Docker is a tool to package applications in small containers.
* Those containers are composed by an operative system (Windows, Linux) and the executable that is meant to be run.
* Docker serves an interface to control how those containers are built and what they do to achieve it.
* Differences between Docker and VMs:
    * Docker engine connects directly to OS hardware API
    * Docker "virtualizes" the OS not the hardware
    * VMs uses an interface called Hypervisor, which virtualizes the host hardware on the operative system contained in the Virtual Machine
    * Docker runs faster and smoothly than VMs and consume less host resources which allows them to be very reusable and flexible

![Docker](https://github.com/Groxalf/docker-workshop/blob/master/img/docker-vs-vms.jpg?raw=true)


* Docker images:
    * An image is the result of applying an specification to configure a Docker container.
    * Docker uses a ``Dockerfile`` as the definition of the image. [Dockerfile instructions reference](https://docs.docker.com/engine/reference/builder/)
    * An image can be runned in one or many containers.
    * An image should be working by itself as a self-contained application
    * Docker allows you to creates an image on top of different images.
    * Docker uses layers to build the images. A layer is a set of commands executed that can allow us to play with intermediate images.
    * Intermediate images are useful to increase the speed of the docker image on local. They work as a checkpoint.
    * Docker checks if there are changes on the layers and skip the execution of the current command if not.
    * We can tag an image on docker. That allows us to use it in every place with that tag name. Ex: Dockerfile, docker commands, docker-compose
    * DockerHub is a repository of many different Docker images that we can download and use them to build our containers [DockerHub](http://hub.docker.com)
    * Dockerfile example:
        ```
        FROM any-image:1.x.x
        RUN mkdir /app
        WORKDIR /app
        COPY . .
        RUN npm install
        CMD ["node", "app.js"]
        ```
      ![Docker layers](https://github.com/Groxalf/docker-workshop/blob/master/img/docker-layers.png?raw=true)
    
* Containers:
    * A container is a unit of embedded software that contains the software itself with its dependencies as a self-executable.
    * Containers in docker are the execution of the definition of a Docker image.
    * Containers run isolated from the host. Its possible to connect to them through the Docker Engine. Ex: port mapping, volumes
    * Containers are ephemeral. Think of them to be run and stopped. The data inside a container is volatile and when the container is destroyed the data is destroyed too.
    * Is possible to connect the physical data on the host with the data on the container using a volume. That volume will remain even if the container is destroyed. To create it is enough to execute the docker image specifying the directory where you want to mount the volume in the host and in the containers: Ex: `docker run -v ./volume:/any-folder/node_modules -it any-docker-image-tag`
    ![Volumes](https://github.com/Groxalf/docker-workshop/blob/master/img/volumes.png?raw=true)

* Multistage Builds:
    * Docker has a feature that allows to use an intermediate image to build the executable and copy it from it to a new image where is going to be executed. This allows to have smaller images without dev dependencies in a clean environment.
        ```
        FROM any-docker-image:1.x.x AS build
        COPY . .
        RUN mvn package
        
        FROM any-docker-image-alpine:1.x.x AS app
        COPY --from=build app-name.war .
        CMD ["java", "-cp", "com.any_company_name.app.Application"]
        ```

* Docker Compose:
    * Docker compose is a service orchestrator. Allows you to connect different Docker containers in an isolated environment.
    * It uses a ``docker-compose.yml`` file as the definition of the services. [Docker Compose Reference](https://docs.docker.com/compose/compose-file/)
    * Docker compose creates an isolated environment on the host by each `docker-compose.yml` file. Which means that a cluster of services raised by one compose and another cannot communicate between them implicitly.
    * Docker compose handles the port mappings of each services. In the subnet that the apps and services contained 
    ![Docker-compose map](https://raw.githubusercontent.com/Groxalf/docker-workshop/master/img/docker-compose-architecture.png)
    * Example of docker-compose:
        ```
        version: '3.7'
        services:
            app:
                build:
                    context: .
                depends:
                    - dependency
                ports:
                    - 8080:8080
            dependency:
                image: any-docker-image:1.x.x
                ports:
                    - 3307:3306
        ```
    * The services URL is the same as the name defined in the docker-compose file.
    
* Good practices:
    * Docker nature is to be stateless. Saving data inside a container (a backup file) is not a good idea, Docker containers should always run with the assumption that the data that uses never comes from inside the container.
    * Do not rely on Docker to have a Database engine with a mounted volume in the host-container. Volumes can get corrupted if the container suddenly crashes .
    * Use layers to increase the speed of the image building. Put at the beggining of the Dockerfile those things that change less (like dependency installation), system updates, etc. And at the end what usually changes more.
    * Build the smallest images possible. Use alpine images to run your applications whenever its possible. Alpine images are better to run applications because their small size makes them more flexible/fast/debuggable than their Ubuntu/CentOS/Debian relatives.
    * Use `.dockerignore` to avoid checking changes over files that are not important for the building pipeline. And when building the context to spend less time sending it to the Docker Engine.
    * Best practices for Dockerfile [by Docker](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
    * Tag properly your images. Do not rely on the random naming of docker.