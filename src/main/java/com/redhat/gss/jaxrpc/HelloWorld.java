package com.redhat.gss.jaxrpc;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface HelloWorld extends Remote
{
  public String sayHello(String name) throws RemoteException;
}
