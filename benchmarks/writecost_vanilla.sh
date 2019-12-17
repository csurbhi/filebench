#!/bin/bash

# The idea is that when we separate the GC data from new writes,
# the newer data is hotter and hence it will be overwritten.
# Only in this case will we get better write cost.
# So some write pattern with deletes/random writes
# BG_GC
# New writes with holes in it.
# So maybe run:
# fileserver - run for 60 sec
# then pause for 30 sec
# fileserver again
# then pause for 30 sec


cd /home/surbhi/linux/github/filebench
#for i in {1..20}
#do
#echo outputput/filter-data/vanilla/output_$i
sudo ./filebench -f workloads/workloads/randomrw.f | tee output/DM-SMR3/vanilla/output_randrw &
sudo ./filebench -f workloads/workloads/randomwrite.f | tee output/DM-SMR3/vanilla/output_randwrite &
sudo ./filebench -f workloads/workloads/videoserver.f | tee output/DM-SMR3/vanilla/output_small_vidserver 
sudo ./filebench -f workload/workloads/fileserver.f | tee output/DM-SMR3/vanilla/output_fileserver
# The sync is necessary for the next GC to begin.
sync
# we can also run the video server with this. but for initial testing lets do this
#done


