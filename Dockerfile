FROM openjdk:8-slim-buster

RUN groupadd --gid 1000 myuser \
  && useradd --uid 1000 --gid myuser --shell /bin/bash --create-home myuser

EXPOSE 8080

WORKDIR /app

COPY app.war ./

RUN chown -R myuser:myuser /app

USER myuser

CMD java -jar app.war