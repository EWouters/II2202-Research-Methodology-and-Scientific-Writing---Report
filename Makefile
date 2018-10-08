SHELL:=/bin/bash -O extglob
.DEFAULT_GOAL := mount

mount:
	@-sudo umount /mnt/ssh
	@sudo sshfs eca18086@co13.ics.ele.tue.nl:/home/eca18/eca18086 /mnt/ssh/ -o IdentityFile=/home/dragos/.ssh/id_rsa
	@sudo nohup nautilus /mnt/ssh > /dev/null 2>&1 &
	
umount:
	@sudo umount /mnt/ssh

ssh:
	@ssh -X -Y eca18086@co13.ics.ele.tue.nl

start-vpn:
	@sudo ./server/vpn2 start

nautilus:
	@sudo echo ""
	@sudo nohup nautilus /mnt/ssh > /dev/null 2>&1 &

stop-vpn:
	@sudo ./server/vpn2 stop
