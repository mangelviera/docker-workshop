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
    
## Exercises

1. [WebApp in Python with Docker](./python/README.md)

2. [WebApp in Node with Docker](./node/README.md)

3. [Deploy an app to Heroku](./heroku/README.md)
