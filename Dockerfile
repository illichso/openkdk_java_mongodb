FROM openjdk:latest

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
RUN echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.2 main" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
RUN apt-get update
RUN apt-get install -y mongodb-org
RUN mkdir -p /data/db
RUN nohup mongod &

EXPOSE 27017

ENTRYPOINT ["/bin/bash", "-c", "ls -la -a"]
#ENTRYPOINT /bin/bash -c

