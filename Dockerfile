FROM python:3.5
EXPOSE 5000
WORKDIR /
COPY . /
#RUN apt-get install build-essential
RUN wget http://ftp.gnu.org/gnu/bash/bash-4.1.tar.gz
RUN tar xf bash-4.1.tar.gz
RUN cd bash-4.1 && ./configure && make && make install
RUN apt-get update && apt-get install sudo
RUN apt-get update && apt-get -q -y install unzip aptitude curl 
RUN mkdir -p /opt
RUN cd /opt && wget http://wwwin-people.cisco.com/muthu/jdk-7u79-linux-x64.tar.gz
RUN cd /opt && tar xvfz jdk-7u79-linux-x64.tar.gz
RUN update-alternatives --install "/usr/bin/java" "java" "/opt/jdk1.7.0_79/bin/java" 1
RUN update-alternatives --set java /opt/jdk1.7.0_79/bin/java
RUN echo "deb http://debian.datastax.com/community stable main" | tee -a /etc/apt/sources.list.d/cassandra.sources.list
RUN curl -L http://debian.datastax.com/debian/repo_key | apt-key add -
RUN apt-get update
RUN apt-get install -q -y dsc20=2.0.12-1 cassandra=2.0.12
RUN mkdir -p /opt/cisco && cd /opt/cisco
WORKDIR /opt/cisco
RUN pwd
RUN wget http://10.225.117.109:8083/wso2esb-4.8.1.zip
RUN unzip wso2esb-4.8.1.zip
RUN wget http://10.225.117.109:8082/cvbb-1.0-installer-2015-11-26.tgz
RUN tar zxvf cvbb-1.0-installer-2015-11-26.tgz
RUN pwd
RUN cd cvbb-1.0-installer && ./install
WORKDIR /app
RUN [".shipped/build"]
CMD .shipped/run
