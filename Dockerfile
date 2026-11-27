FROM node:22-alpine
WORKDIR /app
RUN apk add --no-cache unzip
COPY zayro-truco-railway.zip /tmp/jogo.zip
RUN unzip -o /tmp/jogo.zip -d /app
RUN npm install --omit=dev
CMD ["node", "server.js"]
