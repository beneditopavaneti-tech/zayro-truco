FROM node:22-alpine
WORKDIR /app
RUN apk add --no-cache unzip
COPY zayro-truco-railway.zip /tmp/jogo.zip
RUN unzip -o /tmp/jogo.zip -d /app
RUN node -e 'const fs=require('"'"'node:fs'"'"');const p='"'"'/app/mesa.html'"'"';const s=fs.readFileSync(p,'"'"'utf8'"'"');const a="$('"'"'customBanner'"'"').hidden=!s.custom&&!s.live;$('"'"'customBanner'"'"').textContent=(s.live?'"'"'SALA DE LIVE • narrador vê todas as cartas. Não assista à transmissão durante a partida. '"'"':'"'"''"'"')+(s.custom?'"'"'Mãos personalizadas a cada 3 mãos, abertas a todos.'"'"':'"'"''"'"');",b="$('"'"'customBanner'"'"').hidden=!s.custom;$('"'"'customBanner'"'"').textContent=s.custom?'"'"'Mãos personalizadas a cada 3 mãos, abertas a todos.'"'"':'"'"''"'"';";if(s.includes(a)){fs.writeFileSync(p,s.replace(a,b));}else if(!s.includes('"'"'SALA DE LIVE • narrador vê todas as cartas. Não assista à transmissão durante a partida.'"'"')){console.log('"'"'Banner already absent'"'"');}else{throw new Error('"'"'Unexpected live banner markup'"'"');}'
RUN npm install --omit=dev
CMD ["node", "server.js"]
