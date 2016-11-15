# nagios-tests #
This Repository contains useful check-scripts for Nagios.

## check_port_listener ##
This script checks if there is **any** service listening on a specified port of the **local** machine.<br/>
It uses a combination of the Linux commands netstat, sed and grep to do that.
This way the script can be used out of the box, but **only on Linux**.<br/>
Use it with the parameter -h or --help to get usage- and parameter information.

## check_internet_access ##
This script checks if the **local** machine has access to the internet.<br/>
It sends an HTTP request to google.com.<br/>
Use it with the parameter -h or --help to get usage- and parameter information.

## check_printer ##
This script checks the status of a printer, using SNMP.<br/>
To do this, it uses the commands snmpwalk and snmpget. So these commands have to be installed.<br/>
Version 0.1 can only test the amount of consumables, which usually means ink cartridges.<br/>
It has been tested with HP printers, but should also work with printers made by other manufacturers.
