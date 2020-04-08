#!/usr/bin/env sh
# https://github.com/drduh/config/blob/master/scripts/compute.sh
set -e
ip=$(curl -m 3 -sq https://icanhazip.com/)
for rule in ssh-tcp-22 dnscrypt-udp-443 obfs4-tcp-10022 ; do
	gcloud compute firewall-rules update --source-ranges=${ip} ${rule}
done
