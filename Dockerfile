FROM semoss/docker:4.2.0
RUN pip3 install jupyterhub jhsingle-native-proxy>=0.0.9

# create a user, since we don't want to run as root
#RUN useradd -m jovyan
#ENV HOME=/home/jovyan
#WORKDIR $HOME
#USER jovyan

#COPY --chown=jovyan:jovyan entrypoint.sh /home/jovyan

EXPOSE 8888

ENTRYPOINT ["/opt/apache-tomcat-9.0.26/bin/start.sh"]

CMD ["jhsingle-native-proxy", "--destport", "8080", "start.sh", "hello", "{--}server.port", "{port}", "{--}server.headless", "True", "{--}server.enableCORS", "False", "--port", "8888"]
