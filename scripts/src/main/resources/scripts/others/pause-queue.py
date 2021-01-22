import sys
import time
import traceback

# *************************************************************************
# Variables
# *************************************************************************
class bcolors:
   BOLD    = '\033[1m'
   GREEN   = '\033[92m'
   RED     = '\033[91m'
   YELLOW  = '\033[93m'
   ENDC    = '\033[0m'

# *************************************************************************
# Functions
# *************************************************************************

def getTime():
   try:
      return time.strftime("%d/%m-%Y %H:%M")
   except:
     print
     print bcolors.RED + "# Exception in getTime #"
     traceback.print_exc(file=sys.stdout)
     print bcolors.ENDC
     exit()

def printBold(text):
   try:
      print bcolors.BOLD + text + bcolors.ENDC
   except:
     print
     print bcolors.RED + "# Exception in printBold #"
     traceback.print_exc(file=sys.stdout)
     print bcolors.ENDC
     exit()

def printGreen(text):
   try:
      print bcolors.GREEN + text + bcolors.ENDC
   except:
     print
     print bcolors.RED + "# Exception in printGreen #"
     traceback.print_exc(file=sys.stdout)
     print bcolors.ENDC
     exit()

def printRed(text):
   try:
      print bcolors.RED + text + bcolors.ENDC
   except:
     print
     print bcolors.RED + "# Exception in printRed #"
     traceback.print_exc(file=sys.stdout)
     print bcolors.ENDC
     exit()

def print_usage():
   print
   print "================================================================================"
   printRed("The QUEUE_NAME and QUEUE_OPERATION variables must be set in Linux.")
   print
   printBold("QUEUE_OPERATION valid values:")
   printBold("pauseConsumption, pauseInsertion, pauseProduction")
   printBold("resumeConsumption, resumeInsertion, resumeProduction")
   printBold("status")
   print "================================================================================"
   print
   os._exit(1)

def validate_parameters(queue_name, queue_operation):
   try:
      operations = ["pauseConsumption","pauseInsertion","pauseProduction","resumeConsumption","resumeInsertion","resumeProduction","status"]
      if (not queue_name) or (queue_operation not in operations):
         print_usage()
   except:
     print
     print bcolors.RED + "# Exception in validate_parameters #"
     traceback.print_exc(file=sys.stdout)
     print bcolors.ENDC
     exit()

def find_queues(queue_name):
   try:
      queue_paths = [] 
      servers = domainRuntimeService.getServerRuntimes()
      for server in servers:
         # Ignore the AdminServer
         if server.getName() == serverName:
            continue
         jmsRuntime = server.getJMSRuntime()
         jmsServers = jmsRuntime.getJMSServers()
         for jmsServer in jmsServers:
            destinations = jmsServer.getDestinations()
            for destination in destinations:
               if queue_name in destination.getName():
                  #print destination.getName().split("!")[1]
                  queue_paths.append(destination)
      return queue_paths 
   except:
     print
     print bcolors.RED + "# Exception in find_queues #"
     traceback.print_exc(file=sys.stdout)
     print bcolors.ENDC
     exit()

def queue_status(queue, status_text):
   try:
      print "================================================================================"
      printBold(status_text + queue.getName())
      print "================================================================================"
      state = queue.getConsumptionPausedState()
      if "Enabled" in state:
         printGreen("  " + state)
      else:
         printRed("  " + state)
      state = queue.getInsertionPausedState()
      if "Enabled" in state:
         printGreen("  " + state)
      else:
         printRed("  " + state)
      state = queue.getProductionPausedState()
      if "Enabled" in state:
         printGreen("  " + state)
      else:
         printRed("  " + state)
      print bcolors.ENDC
   except:
     print
     print bcolors.RED + "# Exception in queue_status #"
     traceback.print_exc(file=sys.stdout)
     print bcolors.ENDC
     exit()

def queue_stop_start(queue, queue_operation):
   try:
      if   queue_operation == "pauseConsumption":
         printBold("Pausing Consumption: " + getTime())
         queue.pauseConsumption()
      elif queue_operation == "pauseInsertion":
         printBold("Pausing Insertion: " + getTime())
         queue.pauseInsertion()
      elif queue_operation == "pauseProduction":
         printBold("Pausing Production: " + getTime())
         queue.pauseProduction()
         
      elif queue_operation == "resumeConsumption":
         printBold("Resuming Consumption: " + getTime())
         queue.resumeConsumption()
      elif queue_operation == "resumeInsertion":
         printBold("Resuming Insertion: " + getTime())
         queue.resumeInsertion()
      elif queue_operation == "resumeProduction":
         printBold("Resuming Production: " + getTime())
         queue.resumeProduction()
      print   
   except:
     print
     print bcolors.RED + "# Exception in queue_stop_start #"
     traceback.print_exc(file=sys.stdout)
     print bcolors.ENDC
     exit()

# *************************************************************************
# Main
# *************************************************************************

queue_name      = os.environ.get('QUEUE_NAME')
queue_operation = os.environ.get('QUEUE_OPERATION')

if 'false' in isAdminServer:
   print "Not connected to an AdminServer"
   exit()

validate_parameters(queue_name, queue_operation)

redirect(outputFile='/dev/null',toStdOut='false')
domainRuntime()
stopRedirect()

queues = find_queues(queue_name)
for queue in queues:
   if queue_operation == "status":
      queue_status(queue, "Status for: ")
   else:   
      queue_status(queue, "Before status: ")
      queue_stop_start(queue, queue_operation)
      queue_status(queue, "After status: ")
