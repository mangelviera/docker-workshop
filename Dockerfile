FROM node:13.3.0-alpine3.10
RUN mkdir /app
WORKDIR /app
ENV PORT 8080

COPY node/ .

RUN npm install

CMD ["node", "app.js"]