FROM centos:centos7
RUN rpm -Uvh https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm
RUN yum update -y && yum install wget java-1.8.0-openjdk unzip -y && yum install postgresql96 -y

ENV PATH /usr/pgsql-9.6/bin:$PATH

RUN mkdir /opt/pentaho
WORKDIR /opt/pentaho


ADD ./distr/ /opt/pentaho


RUN echo "Create .kettle folder"
RUN mkdir /root/.kettle

RUN echo "Create Pentaho Kettle app folder"
RUN mkdir /opt/app

RUN echo "Copy schema.xml to Kettle app folder"
ADD ./init/app_pentaho_di/ /tmp/app
RUN cp /tmp/app/shared.xml /root/.kettle

RUN echo "Copy mssql jdbc lib to pentaho"
RUN cp /tmp/app/sqljdbc42.jar /opt/pentaho/libswt/linux/x86_64

RUN echo "Copy app from tmp to app folder"
RUN cp /tmp/app/* /opt/app 
 
WORKDIR /opt/pentaho/


