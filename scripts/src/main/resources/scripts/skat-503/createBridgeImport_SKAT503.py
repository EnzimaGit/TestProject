#*******************************************************************************************************
#Variables
#*******************************************************************************************************
RIS_MANAGED_SERVER_URL='t3://sktudv02:8401'
IMPORT_MANAGED_SERVER_URL='t3://sktudv02:8001'


def create_destination(JMSBridgeDestination,ConnectionFactoryJNDIName,DestinationJNDIName,ConnectionURL):
	cmo.createJMSBridgeDestination(JMSBridgeDestination)
        JMSBridgeDestination = cmo.lookupJMSBridgeDestination(JMSBridgeDestination)
        JMSBridgeDestination.setClasspath('')
	JMSBridgeDestination.setConnectionURL(ConnectionURL)
        JMSBridgeDestination.setAdapterJNDIName('eis.jms.WLSConnectionFactoryJNDINoTX')
        JMSBridgeDestination.setConnectionFactoryJNDIName(ConnectionFactoryJNDIName)
        JMSBridgeDestination.setDestinationJNDIName(DestinationJNDIName)
        return JMSBridgeDestination
  
def create_bridge(MessagingBridge,Cluster,srcbdest,TJMSBridgeDestination,qos):
	cmo.createMessagingBridge(MessagingBridge)
        bridge = cmo.lookupMessagingBridge(MessagingBridge)
        cluster = cmo.lookupCluster(Cluster)
        targets = bridge.getTargets()
        targets.append(cluster)
        bridge.setTargets(targets)
        bridge.setSourceDestination(srcbdest)
        bridge.setTargetDestination(TJMSBridgeDestination)
        bridge.setStarted(true)
        bridge.setSelector('')
        bridge.setQualityOfService(qos)
		


		
print 'START EDIT MODE'

domainConfig()
edit()
startEdit()

MessagingBridge='ImportRISINBridge'
print 'CREATE SOURCE JMS BRIDGE DESTINATION'
S_Dest='RISImportOUTSource'
S_ConnFJNDI='ris/jms/RISRASJMSConnectionFactory'
S_DestJNDI='ris/jms/ImportOUTQueue'
src=create_destination(S_Dest,S_ConnFJNDI,S_DestJNDI,RIS_MANAGED_SERVER_URL)

print 'CREATE TARGET JMS BRIDGE DESTINATION'

T_Dest='ImportRISINDestination'
T_ConnFJNDI='import/jms/JMSConnectionFactory'
T_DestJNDI='import/jms/RISINQueue'
target=create_destination(T_Dest,T_ConnFJNDI,T_DestJNDI,IMPORT_MANAGED_SERVER_URL)

print 'CREATE MESSAGING BRIDGE'
cluster='wlsCluster'
qos='Duplicate-okay'
create_bridge(MessagingBridge,cluster,src,target,qos)

save()
activate(block="true")
exit()





