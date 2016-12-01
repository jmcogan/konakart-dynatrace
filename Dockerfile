#FROM debian:jessie
FROM java:7
MAINTAINER vu.pham

#Update the repository
RUN apt-get update

#Install Java Runtime Environment for KonaKart
#RUN apt-get install -y openjdk-7-jre

#Add files to directories on Docker Container
CMD echo "Adding installation script"
ADD ./installation.sh /opt/
ADD ./runkonakart.sh /opt/
ADD ./konakart-installation /tmp/
ADD ./dynatrace-agent-6.5.0.1289-unix.jar /opt/
ADD ./catalina.sh /tmp/

#install agent
CMD /bin/bash java -jar dynatrace-agent-6.5.0.1289-unix.jar -y

#Listen on default konakart port
EXPOSE 8780
EXPOSE 9998

#Run konakart
CMD /bin/bash /opt/installation.sh

#Example usage:
# sudo docker run -d -p 8080:8780 --name konakart_app -e DB_ADDRESS=x.x.x.x -e DB_PORT=PORT –e repository_name

