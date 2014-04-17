#!/bin/bash

# shutdown the dev tomcat server.
sudo -u tomcat CATALINA_BASE=/opt/tomcat/devserver /opt/tomcat/bin/shutdown.sh
