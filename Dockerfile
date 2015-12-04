FROM phusion/baseimage:0.9.17
EXPOSE 5000
WORKDIR /
COPY . /
#RUN wget http://ftp.gnu.org/gnu/bash/bash-4.1.tar.gz
#RUN tar xf bash-4.1.tar.gz
#RUN cd bash-4.1 && ./configure && make && make install
RUN apt-get update && apt-get -q -y install sudo wget unzip aptitude curl 
RUN mkdir -p /opt
RUN cd /opt && wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz"
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
RUN wget https://dl.bintray.com/muthumayan/test/flatdir/wso2esb-4.8.1.zip
RUN unzip wso2esb-4.8.1.zip
RUN wget https://dl.bintray.com/muthumayan/test/flatdir/cvbb-1.0-installer-2015-11-26.tgz
RUN tar zxvf cvbb-1.0-installer-2015-11-26.tgz
RUN pwd
RUN cd cvbb-1.0-installer && ./install
WORKDIR /
RUN mkdir -p /etc/my_init.d
ADD cvbb.sh /etc/my_init.d/cvbb.sh
# RUN [".shipped/build"]
CMD ["/sbin/my_init"]
