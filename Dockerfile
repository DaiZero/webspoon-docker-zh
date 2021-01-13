FROM hiromuhota/webspoon:0.9.0.22

LABEL maintainer="dzd624175217@gmail.com"

ENV MYSQL_CONNECTOR_VERSION=5.1.49 \
    KETTLE_HOME="/home/tomcat/.pentaho"

ARG DEBIAN_FRONTEND=noninteractive

USER root

# 添加mysql驱动
ADD https://repo1.maven.org/maven2/mysql/mysql-connector-java/${MYSQL_CONNECTOR_VERSION}/mysql-connector-java-${MYSQL_CONNECTOR_VERSION}.jar ${CATALINA_HOME}/webapps/spoon/WEB-INF/lib/

RUN apt-get clean && apt-get update \
        && apt-get install --assume-yes apt-utils \
        && apt-get install -y vim locales ttf-wqy-zenhei ibus ibus-gtk ibus-pinyin

RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 \
 && echo "Asia/Shanghai" > /etc/timezone

USER tomcat

ENV LANG=zh_CN.utf8
ENV LC_ALL=zh_CN.utf8
