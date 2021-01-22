def createQueue(name,systemModule,jndi,subDeployment):

   cd('/JMSSystemResources/'+systemModule+'/JMSResource/'+systemModule)

   cmo.createQueue(name)

   cd('/JMSSystemResources/'+systemModule+'/JMSResource/'+systemModule+'/Queues/'+name)

   cmo.setJNDIName(jndi)

   cmo.setSubDeploymentName(subDeployment)

   
def setErrorDestination(destination,systemModule,errorDest,expirationPolicy,redeliveryDelay,redeliveryLimit):

   cd('/JMSSystemResources/'+systemModule+'/JMSResource/'+systemModule+'/Queues/'+destination+'/DeliveryFailureParams/'+destination)

   cmo.setErrorDestination(getMBean('/JMSSystemResources/'+systemModule+'/JMSResource/'+systemModule+'/Queues/'+errorDest))

   cmo.setExpirationPolicy(expirationPolicy)

   if not redeliveryLimit == -1:

      cd('/JMSSystemResources/'+systemModule+'/JMSResource/'+systemModule+'/Queues/'+destination+'/DeliveryFailureParams/'+destination)

      cmo.setRedeliveryLimit(redeliveryLimit)

   if not redeliveryDelay == -1:

      cd('/JMSSystemResources/'+systemModule+'/JMSResource/'+systemModule+'/Queues/'+destination+'/DeliveryParamsOverrides/'+destination)

      cmo.setRedeliveryDelay(redeliveryDelay)   
 
 
###### MAIN ############################

domainConfig()

edit()

startEdit()

impModule = 'ImportSystemModule'

createQueue(name='RISINQueue',systemModule=impModule,jndi='import/jms/RISINQueue',subDeployment='ImportJMSSubdeployment')
createQueue(name='RISOUTQueue',systemModule=impModule,jndi='import/jms/RISOUTQueue',subDeployment='ImportJMSSubdeployment')
createQueue(name='RISErrorQueue',systemModule=impModule,jndi='import/jms/RISErrorQueue',subDeployment='ImportJMSSubdeployment')
setErrorDestination(destination='RISINQueue',systemModule=impModule,errorDest='RISErrorQueue',expirationPolicy='Redirect',redeliveryDelay=300000,redeliveryLimit=5)
setErrorDestination(destination='RISOUTQueue',systemModule=impModule,errorDest='RISErrorQueue',expirationPolicy='Redirect',redeliveryDelay=300000,redeliveryLimit=5)
save()
activate(block="true")
exit()
