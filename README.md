在 ESXi 6.0 下设置定时关机任务时，发现重启后 /var/spool/cron/crontabs/root 被还原，所以要在 /etc/rc.local.d/local.sh 加入相关命令，确保服务器每次启动都加入定时关机任务。

具体命令：

	# Gets the cron service pid and simply kills it.
	/bin/kill $(cat /var/run/crond.pid)

	# The next line writes a typical cron line to the crontab
	/bin/echo "40 17 * * * /bin/poweroff" >> /var/spool/cron/crontabs/root

	# Finally we start the cron service again
	/usr/lib/vmware/busybox/bin/busybox crond

相关网页：

	https://communities.vmware.com/thread/545078
	https://www.stephen-scotter.net/computers/virtualisation/ghettovbb-esxi-5-5-crontab