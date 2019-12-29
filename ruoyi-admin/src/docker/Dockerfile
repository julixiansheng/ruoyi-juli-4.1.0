FROM java:8
EXPOSE 80

VOLUME /tmp
ADD ruoyi-admin.jar /app.jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-jar","/app.jar"]
