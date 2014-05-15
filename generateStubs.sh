#!/bin/bash

# This script invokes WSTools and moves the generated artifacts to the 
# appropriate place in the maven project.

if [ ! $JBOSS_HOME ]; then
  echo JBOSS_HOME not set.
  exit 1
fi

if [ ! -f $JBOSS_HOME/bin/wstools.sh ]; then
  echo wstools.sh not found in JBoss installation.  
  echo Are you using EAP 5?
  exit 1
fi

$JBOSS_HOME/bin/wstools.sh -cp target/classes -config src/main/resources/wstools-config.xml

if [ $? ]; then #If wstools succeeded
  echo Moving files...
  mv webservices.xml jaxrpc-mapping.xml src/main/webapp/WEB-INF
  mv com/redhat/gss/jaxrpc/* src/main/java/com/redhat/gss/jaxrpc
  mv wsdl src/main/webapp/WEB-INF/wsdl
  rm -rf com/
fi
