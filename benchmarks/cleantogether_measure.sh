#!/bin/bash

# Mix different random writes and sequential writes
# sync in between so that random writes are not 
# served from memory
# At the end we expect a bad sequential score
# if the writes are truly random, the score should
# improve

sync_intermittently()
{
	for i in {1..40}
	do
		sleep 10
		sync
	done
}


cd /github/filebench-1.5-alpha3
#for i in {1..20}
#do
#echo outputput/filter-data/vanilla/output_$i
sudo ./filebench -f workloads/fileserver.f | tee outputput/cleantogether/output_fileserver &
sudo ./filebench -f workloads/randrw.f | tee outputput/cleantogether/output_randrw & 
sudo ./filebench -f workloads/videoserver.f | tee outputput/cleantogether/output_small_vidserver &
sudo ./filebench -f workloads/randomwrite.f | tee outputput/cleantogether/output_randwrite &
sync_intermittently &
# we can also run the video server with this. but for initial testing lets do this
#done
