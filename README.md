# nagios-tests #
This Repository contains useful check-scripts for Nagios.

## check_port_listener ##
This script checks if there is **any** service listening on a specified port of the **local** machine.<br/>
It uses a combination of the Linux commands netstat, sed and grep to do that.
This way the script can be used out of the box, but **only on Linux**.<br/>
Use it with the parameter -h or --help to get usage- and parameter information.
