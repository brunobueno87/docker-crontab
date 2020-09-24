FROM centos:7

RUN yum -y update
RUN yum -y install crontabs

#Add your cron file
ADD crondata /etc/cron.d/cron_test
RUN chmod 0644 /etc/cron.d/cron_test

#This will add it to the cron table (crontab -e)
RUN crontab /etc/cron.d/cron_test
RUN rm -rvf /var/run/crond.pid

ENTRYPOINT [ "/usr/sbin/crond", "-n" ]
