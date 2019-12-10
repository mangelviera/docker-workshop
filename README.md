## Docker from scratch

* Docker is a tool to package applications in small containers.
* Those containers are composed by an operative system (Windows, Linux)
* Docker serves an interface to control how those containers are built and what they do.
* Differences between Docker and VMs:
    * Docker engine connects directly to OS hardware API
    * Docker "virtualizes" the OS not the hardware
    * VMs uses an interface called Hypervisor, which virtualizes the host hardware on the operative system contained in the Virtual Machine
    * Docker runs faster and smoothly than VMs and consume less host resources which allows them to be very reusable and flexible

![Docker](https://www.itdo.com/blog/content/images/2019/02/comparacion-container-docker_By_0WBFrV.jpg)


* Docker images:
    * An image is the result of applying an specification to configure a Docker container.
    * Docker uses a ``Dockerfile`` as the definition of the image. [Dockerfile instructions reference](https://docs.docker.com/engine/reference/builder/)
    * An image can be runned in one or many containers.
    * An image should be working by itself as a self-contained application
    * Docker allows you to creates a container on top of different images.
    * DockerHub is a repository of many different Docker images that we can download and use them to build our containers 
    * Docker uses layers to build the images. A layer is a set of commands executed that can allow us to play with intermediate images.
    * Intermediate images are useful to increase the speed of the docker image on local. They work as a checkpoint.
    * Docker checks if there are changes on the layers and skip the execution of the current command if not.

* Docker Compose:
    * Docker compose is a service orchestrator. Allows you to connect different Docker containers in an isolated environment.
    * It uses a ``docker-compose.yml`` file as the definition of the services. [Docker Compose Reference](    * It uses a ``docker-compose.yml`` file as the definition of the services. [Docker Compose Reference](https://docs.docker.com/compose/compose-file/)
    
* Good practices:
    * Docker nature is to be stateless. Saving data inside a container (a backup file) is not a good idea, Docker containers should always run with the assumption that the data that uses never comes from inside the container.
    * Do not rely on Docker to have a Database engine with a mounted volume in the host-container. Volumes can get corrupted if the container suddenly crashes .
    * Use layers to increase the speed of the image building. Put at the beggining of the Dockerfile those things that change less (like dependency installation), system updates, etc. And at the end what usually changes more.   