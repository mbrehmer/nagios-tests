#!/bin/bash

################################################################################
#                                                                              #
# A Nagios Plugin that checks if there is any program listening on a specified #
# TCP/UDP port.                                                                #
#                                                                              #
# Copyright (C) 2016 Martin Brehmer <software@mbrehmer.de>                     #
#                                                                              #
# This program is free software; you can redistribute it and/or modify         #
# it under the terms of the GNU General Public License as published by         #
# the Free Software Foundation; either version 2, or (at your option)          #
# any later version.                                                           #
#                                                                              #
# This program is distributed in the hope that it will be useful,              #
# but WITHOUT ANY WARRANTY; without even the implied warranty of               #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                #
# GNU General Public License for more details.                                 #
#                                                                              #
# You should have received a copy of the GNU General Public License            #
# along with this program; if not, write to the Free Software Foundation,      #
# Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.           #
#                                                                              #
################################################################################

VERSION=0.1

STATE_OK=0
STATE_WARNING=1
STATE_CRITICAL=2
STATE_UNKNOWN=3
STATE_DEPENDENT=4

PROG_NAME=$(basename $0)

print_version()
{
	cat <<EOF
$PROG_NAME $VERSION

Copyright (C) 2016 Martin Brehmer <software@mbrehmer.de>

This is free software.  You may redistribute copies of it under the terms of
the GNU General Public License <http://www.gnu.org/licenses/gpl.html>.
There is NO WARRANTY, to the extent permitted by law.
EOF
}

SHORT_OPTS="p:P:l:vV"
LONG_OPTS="port,protocoll,listen,version,verbose"

# parameter processing
$(getopt -T >/dev/null 2>&1)
if [[ $? -eq 4 ]]; then
	OPTS=$(getopt -o $SHORT_OPTS --long $LONG_OPTS -n "$PROG_NAME" -- "$@")
else
	case $1 in
		--version)
			print_version
			exit 0
		;;
	esac
	OPTS=$(getopt $SHORT_OPTS "$@")
fi

eval set -- "$OPTS"

declare -i PORT

# default values
PORT=0
ADDRESS="0.0.0.0"
PROTOCOL="tcp"
VERBOSE=false

while [[ $# -gt 0 ]]; do
	case $1 in
		-V|--version)
			print_version
			exit 0
			;;
		-l|--listen)
			ADDRESS=$2
			shift 2
			;;
		-p|--port)
			PORT=$2
			shift 2
			;;
		-P|--protocol)
			PROTOCOL=$2
			shift 2
			;;
		-v|--verbose)
			VERBOSE=true
			shift
			;;
		--)
			shift
			break
			;;
		*)
			echo "Internal Error: parameter processing error: $1" >&2
			exit 1
			;;
	esac
done
