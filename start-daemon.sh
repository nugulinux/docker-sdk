#!/bin/sh

dbus-daemon-proxy --system &

cat << EOF

-----------------------------------------------------------
Please use the following address when connecting to dbus.

	tcp:host=localhost,port=8080,family=ipv4

Example:

  $ gdbus introspect -d com.sktnugu.nugud -o / \\
	--address 'tcp:host=localhost,port=8080,family=ipv4'

'nugud' information:

  - destination name: com.sktnugu.nugud
  - object path: /

-----------------------------------------------------------
EOF

nugusdk_start_sample /usr/bin/nugud
