FROM node:18-alpine

RUN apk update && apk add git

WORKDIR /avni

ARG BACKEND_URL=http://localhost:8021
ARG ETL_URL=http://localhost:8022
ARG REACT_APP_ENVIRONMENT=production

ENV BACKEND_URL ${BACKEND_URL}
ENV ETL_URL ${ETL_URL}
ENV REACT_APP_ENVIRONMENT ${REACT_APP_ENVIRONMENT}

COPY . ./

RUN yarn install
RUN yarn build

RUN yarn global add serve
CMD [ "serve", "-s", "build" ]