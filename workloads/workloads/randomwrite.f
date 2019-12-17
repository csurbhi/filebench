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
set $filesize=2000g
set $iosize=8k
set $nthreads=10
set $workingset=0
set $directio=0

define file name=randwritefile1,path=$dir,size=$filesize,prealloc,reuse,paralloc

define process name=rand-write,instances=1
{
  thread name=rand-thread,memsize=5m,instances=$nthreads
  {
    flowop write name=rand-write1,filename=randwritefile1,iosize=$iosize,random,workingset=$workingset,directio=$directio
  }
}

echo "Random Write Version 3.0 personality successfully loaded"
system "sync"
system "echo 3> /proc/sys/vm/drop_caches"
psrun -60 1800
