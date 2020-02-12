#!/bin/bash

sync_intermittently()
{
	for i in {1..40}
	do
		sleep 10
		sync
	done
}

cd /home/surbhi/github/filebench
sudo ./fix
sudo ./filebench -f workloads/videoserver.f | tee ~/vidserver.out &
sudo filebench -f workloads/randomrw.f | tee ~/randomrw.out &
sync_intermittently &
