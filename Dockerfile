FROM node:12 AS build

USER node
RUN mkdir /home/node/app
WORKDIR /home/node/app
COPY --chown=node . .
RUN yarn && yarn build

FROM node:12

RUN yarn global add serve
USER node
RUN mkdir /home/node/app
WORKDIR /home/node/app
COPY --from=build /home/node/app/build/ build
EXPOSE 5000
CMD [ "serve", "-s", "build" ]