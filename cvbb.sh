#!/bin/sh


/etc/init.d/syslog-ng start
/etc/init.d/cvbb-esbd start
/etc/init.d/cvbb-license-loggerd start
/etc/init.d/cvbb-xmpp-gatewayd start
/etc/init.d/cvbn-cmot-gatewayd start
/etc/init.d/cvbn-host-agentd start
/etc/init.d/cvbn-muxd start
/etc/init.d/cvbn-service-agentd start
/etc/init.d/ejabberd start
/etc/init.d/ntp start
/etc/init.d/cassandra start
/etc/init.d/apache2 start
/etc/init.d/ondemand start
gotty -p 9000 -w bash &

