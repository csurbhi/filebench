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
set $filesize=2500g
set $iosize=8k
set $nthreads=42
set $workingset=0
set $directio=0
debug 10
define file name=largefile1,path=$dir,size=$filesize,prealloc,reuse,paralloc

define process name=rand-rw,instances=1
{
  thread name=rand-r-thread,memsize=5m,instances=$nthreads
  {
    flowop read name=rand-read1,filename=largefile1,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=1
    flowop delay name="delay1",value=2
  }
  thread name=rand-w-thread,memsize=5m,instances=$nthreads
  {
    flowop write name=rand-write1,filename=largefile1,iosize=$iosize,random,workingset=$workingset,directio=$directio,fd=1
    flowop delay name="delay2",value=10
  }
  #Adding the next thread
  #thread name=fsync-thread,instances=1
  # {
  #  flowop openfile name="openfile1",filename=largefile1,fd=2
  #  flowop delay name="delay3",value=10
  #  flowop fsync name="fsync4",fd=2
  #  flowop closefile name="closefile1",fd=2
  #  flowop delay name="delay5",value=10
  #}
}

echo "Random RW Version 3.0 personality successfully loaded"

psrun 15 60
