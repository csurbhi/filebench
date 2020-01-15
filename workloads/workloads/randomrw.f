#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
#
# Copyright 2009 Sun Microsystems, Inc.  All rights reserved.
# Use is subject to license terms.
#

set $dir=/mnt/
set $filesize=200m
set $iosize=4k
set $nthreads=60
set $workingset=0
set $directio=0
define file name=randrwfile1,path=$dir,size=160m,prealloc,reuse,paralloc
define file name=randrwfile2,path=$dir,size=200m,prealloc,reuse,paralloc
define file name=randrwfile3,path=$dir,size=300m,prealloc,reuse,paralloc
define file name=randrwfile4,path=$dir,size=250m,prealloc,reuse,paralloc
define file name=randrwfile5,path=$dir,size=350m,prealloc,reuse,paralloc

define process name=rand-rw,instances=2
{
  thread name=rand-r-thread,memsize=100m,instances=80
  {
    flowop read name=rand-read1,filename=randrwfile1,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=1
    flowop read name=rand-read2,filename=randrwfile2,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=2
    flowop read name=rand-read3,filename=randrwfile3,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=3
  }
  thread name=rand-w-thread,memsize=100m,instances=$nthreads
  {
    flowop write name=rand-write5,filename=randrwfile2,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=2
    flowop write name=rand-write1,filename=randrwfile1,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=1
    flowop write name=rand-write2,filename=randrwfile1,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=1
    flowop write name=rand-write3,filename=randrwfile3,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=3
    flowop write name=rand-write4,filename=randrwfile3,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=3
    flowop write name=rand-write6,filename=randrwfile2,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=2
    flowop write name=rand-write14,filename=randrwfile4,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=4
    flowop write name=rand-write37,filename=randrwfile5,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=5
    flowop delay name="delay1",value=100

    flowop write name=rand-write7,filename=randrwfile2,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=2
    flowop write name=rand-write8,filename=randrwfile1,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=1
    flowop write name=rand-write9,filename=randrwfile1,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=1
    flowop write name=rand-write10,filename=randrwfile3,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=3
    flowop write name=rand-write11,filename=randrwfile3,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=3
    flowop write name=rand-write12,filename=randrwfile2,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=2
    flowop write name=rand-write13,filename=randrwfile4,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=4
    flowop write name=rand-write38,filename=randrwfile5,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=5
    flowop delay name="delay2",value=100

    flowop write name=rand-write15,filename=randrwfile2,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=2
    flowop write name=rand-write16,filename=randrwfile1,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=1
    flowop write name=rand-write17,filename=randrwfile1,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=1
    flowop write name=rand-write18,filename=randrwfile3,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=3
    flowop write name=rand-write19,filename=randrwfile3,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=3
    flowop write name=rand-write20,filename=randrwfile2,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=2
    flowop write name=rand-write21,filename=randrwfile4,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=4
    flowop write name=rand-write39,filename=randrwfile5,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=5
    flowop delay name="delay3",value=40

    flowop write name=rand-write22,filename=randrwfile2,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=2
    flowop write name=rand-write23,filename=randrwfile1,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=1
    flowop write name=rand-write24,filename=randrwfile1,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=1
    flowop write name=rand-write25,filename=randrwfile3,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=3
    flowop write name=rand-write26,filename=randrwfile3,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=3
    flowop write name=rand-write27,filename=randrwfile2,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=2
    flowop write name=rand-write28,filename=randrwfile4,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=4
    flowop write name=rand-write40,filename=randrwfile5,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=5
    flowop delay name="delay4",value=40

    flowop write name=rand-write29,filename=randrwfile2,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=2
    flowop write name=rand-write30,filename=randrwfile1,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=1
    flowop write name=rand-write31,filename=randrwfile1,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=1
    flowop write name=rand-write32,filename=randrwfile3,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=3
    flowop write name=rand-write33,filename=randrwfile3,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=3
    flowop write name=rand-write34,filename=randrwfile2,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=2
    flowop write name=rand-write35,filename=randrwfile4,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=4
    flowop write name=rand-write36,filename=randrwfile5,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=5
    flowop delay name="delay5",value=40
  }
}

echo "Random RW Version 3.0 personality successfully loaded"

system "sync"
system "echo 3> /proc/sys/vm/drop_caches"
psrun -720 7200
