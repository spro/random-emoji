# FROM spro/coffee-base
FROM mhart/alpine-node:10
# RUN apt update -y && apt install git vim -y
RUN npm install -g coffeescript
COPY random-emoji random-emoji
RUN cd random-emoji && npm install --production
ENV EMOJIS_FILENAME=cat-emojis.txt
ENTRYPOINT ["sh", "-c", "cd random-emoji && coffee server.coffee"]
