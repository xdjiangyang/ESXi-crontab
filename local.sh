#!/bin/sh

# local configuration options

# Note: modify at your own risk!  If you do/use anything in this
# script that is not part of a stable API (relying on files to be in
# specific places, specific tools, specific output, etc) there is a
# possibility you will end up with a broken system after patching or
# upgrading.  Changes are not supported unless under direction of
# VMware support.

# Gets the cron service pid and simply kills it.
/bin/kill $(cat /var/run/crond.pid)

# The next line writes a typical cron line to the crontab
/bin/echo "40 17 * * * /bin/poweroff" >> /var/spool/cron/crontabs/root

# Finally we start the cron service again
/usr/lib/vmware/busybox/bin/busybox crond

exit 0
