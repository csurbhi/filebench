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


cd /github/filebench-1.5-alpha3
#for i in {1..20}
#do
#echo outputput/filter-data/modified/output_$i
dir="vanilla-taillatency"
sudo ./filebench -f workloads/videoserver.f | tee outputput/$dir/output_small_vidserver
sync
sudo ./filebench -f workloads/randomwrite.f | tee outputput/$dir/output_randwrite
sync
sleep 100
sudo ./filebench -f workloads/fileserver.f | tee outputput/$dir/output_fileserver
# The sync is necessary for the next GC to begin.
sync
sudo ./filebench -f workloads/randomrw.f | tee outputput/$dir/output_randrw
sync

# we can also run the video server with this. but for initial testing lets do this
#done


