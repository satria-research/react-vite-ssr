FROM node:lts-alpine

RUN addgroup app && adduser -S -G app app
RUN mkdir /app && chown app:app /app
USER app
WORKDIR /app

COPY --chown=app:app . .
RUN yarn install
RUN yarn run build

EXPOSE 5173

CMD ["yarn", "start"]