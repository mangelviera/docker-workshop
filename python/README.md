# Hello world WebApp in Python with Docker

* Create a Dockerfile in the root of this project:
* Paste this content inside:
    ```
    FROM python:3.8-alpine3.10
    RUN mkdir /app
    WORKDIR /app
    ENV PORT 8080
    
    COPY python/ .
    
    RUN pip install -r requirements.txt
    
    CMD ["python", "app.py"]
    ```
* Run the following commands in the terminal:
    * `docker build -t hello-world-python .`
    * `docker run -p 8081:8080 -it hello-world-python`

