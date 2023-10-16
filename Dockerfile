FROM eclipse-temurin:8u382-b05-jre-jammy

ARG ESB_VERSION=${VERSION:-5.0.0}

ADD wso2esb-${ESB_VERSION}.zip /opt

RUN apt-get update && \
    apt-get install -y zip && \
    apt-get clean && \
    unzip /opt/wso2esb-${ESB_VERSION}.zip -d /opt && \
    chmod +x /opt/wso2esb-${ESB_VERSION}/bin/wso2server.sh && \
    rm /opt/wso2esb-${ESB_VERSION}.zip

RUN sed -i 's/org.owasp.csrfguard.Enabled = true/org.owasp.csrfguard.Enabled = false/g' /opt/wso2esb-${ESB_VERSION}/repository/conf/security/Owasp.CsrfGuard.Carbon.properties

EXPOSE 9443 9763 8243 8280
WORKDIR /opt/wso2esb-${ESB_VERSION}
ENTRYPOINT ["bin/wso2server.sh"]
