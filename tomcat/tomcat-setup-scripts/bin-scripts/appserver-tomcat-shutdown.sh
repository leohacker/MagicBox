#!/bin/bash

# shutdown the app tomcat server
sudo -u tomcat CATALINA_BASE=/opt/tomcat/appserver /opt/tomcat/bin/shutdown.sh
