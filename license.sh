#!/bin/bash

for i in *; do
    if [ -d $i ]; then


       (cd $i;

	emp="";

	for lic in `grep -R [lL]icense . | cut -f2- -d':' | grep 'nbbuild/licenses/' | sort | uniq | \
       	    sed 's/.*nbbuild\/licenses\/\([A-Za-z0-9\-]*\).*/\1/g' | \
	    sort | uniq | xargs echo`; do

	    echo "$i,$lic";
	    emp=$lic;
	done;

	if [ -z "$emp" ]; then
	    echo "$i,N/A";
	 fi;

	    if [ -d external ]; then

	       (cd external;

	       	for f in *-license.txt; do
		    if [ -f "$f" ]; then
			echo -n "$i,";
			head -10 $f | grep 'License:' | cut -f2- -d':';

		    fi;

		done;
	       )
	    fi;
       )
    fi;

done;
