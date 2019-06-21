#!/bin/bash
cd /configs/
for env in $(ls -l | grep ^d | awk '{print $9}')
do
for kind in $(ls $env)
do
        for project in $(ls   $env/$kind )
    do
        for files in $(ls  $env/$kind/$project/ | grep .json )
    do jsonlint  -q $env/$kind/$project/$files
        RESULT=$?
        if [ $RESULT -eq 0 ]; then
        echo ok
        continue
        #echo ok
        exitcode=0
        exit $exitcode

 else
        echo Error
        echo $env/$kind/$project/$files
        exitcode=2
        exit $exitcode
        fi
        done
    done
done
done
