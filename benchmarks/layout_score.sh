#!/bin/bash

sudo mount /mnt
sudo filebench -f workloads/randomrw.f | tee output/layout_randrw.out
sudo umount /mnt
