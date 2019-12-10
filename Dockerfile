FROM python:3.8-alpine3.10
RUN mkdir /app
WORKDIR /app
ENV PORT 8080

COPY python/ .

RUN pip install -r requirements.txt

CMD ["python", "app.py"]