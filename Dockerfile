FROM ubuntu:12.04

MAINTAINER Franck Besnard <franck@besnard.mobi>

RUN apt-get install -y iputils-ping 
RUN apt-get install -y net-tools
RUN apt-get install -y openssh-server 

RUN apt-get install -y python-software-properties
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
RUN apt-get -y install oracle-java7-installer

RUN echo "" >> /etc/profile
RUN echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle/;export JAVA_HOME" >> /etc/profile
RUN echo "JRE_HOME=/usr/lib/jvm/java-7-oracle/jre;export JRE_HOME" >> /etc/profile

RUN echo "" >> /etc/bash.bashrc
RUN echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle/;export JAVA_HOME" >> /etc/bash.bashrc
RUN echo "JRE_HOME=/usr/lib/jvm/java-7-oracle/jre;export JRE_HOME" >> /etc/bash.bashrc
