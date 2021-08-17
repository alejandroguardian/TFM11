#!/bin/bash

cat /etc/group | grep disk | awk -F: '{ if ( $1 == "disk" ) { if ( $4 != "" ) { print $4} else { print 0} } }'
