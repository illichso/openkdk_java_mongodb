FROM openjdk:latest

#RUN ["/bin/bash", "-c", "apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927", \
#    "echo \"deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.2 main\" |  tee /etc/apt/sources.list.d/mongodb-org-3.2.list", \
#    "apt-get update", \
#    "apt-get install -y mongodb-org", \
#    "mkdir -p /data/db", \
#    "mongod"]

#RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
#RUN echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.2 main" |  tee /etc/apt/sources.list.d/mongodb-org-3.2.list
#RUN apt-get update
#RUN apt-get install -y mongodb-org
#RUN mkdir -p /data/db
#RUN mongod

RUN apt-get update && \
    apt-get install -y sudo && \
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 && \
    echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.2 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list && \
    sudo apt-get install -y mongodb-org && \
    mkdir -p /data/db
#RUN nohup mongod & echo 'Starting Mongod' & wait
RUN sudo service mongod start
#RUN nohup mongod &
RUN echo 'Mongod is started'
#CMD mongod
EXPOSE 27017
#ENTRYPOINT ["/bin/bash"]

