package com.redhat.gss.jaxrpc;

import java.rmi.RemoteException;

import org.jboss.logging.Logger;

public class HelloEndpoint implements HelloWorld
{
  private static Logger log = Logger.getLogger(HelloEndpoint.class);

  public String sayHello(String name) throws RemoteException
  {
    String greeting = "Hello, " + name + "!";
    log.info(greeting);
    return greeting;
  }
}
