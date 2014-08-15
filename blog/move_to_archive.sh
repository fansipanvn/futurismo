#!/bin/bash

if [ $# != 1 ]; then
    echo "usage: $0 next_path" 1>&2
    exit 1
fi

if [ -e $1 ]; then
    # 存在する場合
    next_path=$1
else
    echo "usage: $0 next_path" 1>&2
    exit 1
fi

file_name="${next_path##*/}"
date=`date '+%y%m%d'`
archive_path="archive/"$date"_"$file_name

mv $next_path $archive_path
