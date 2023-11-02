FROM node:20.8.0

RUN apt-get update
RUN apt-get install inetutils-ping -y
RUN apt-get install netcat-traditional -y
RUN apt-get install links -y

RUN npm install -g json-server
RUN npx playwright install
RUN npx playwright install-deps
RUN npm install -g eslint

FROM scratch
COPY --from=0 / /
