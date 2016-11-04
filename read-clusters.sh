ant -f dump.xml  all | grep '^\[echoproperties\]' | cut -f2- -d']' | grep '=' | sed 's/,/ /g' | \
    grep  -v '.depends=' | grep -v '.dir=' | \
    grep -v '^ clusters' | \
    grep -v '.config=' | \
    grep -v '^ validation' | \
    sed 's/nb\.cluster\.//g' | \
    (clusters=""; while read line ; do \
    	  key=`echo $line | cut -f1 -d'=' | sed 's/\./_/g'`; \
	  val=`echo $line | cut -f2- -d'='`; \
	  echo "$key='$val'"; \
	  clusters="$key $clusters"; \
	  done; \
	  echo "clusters='$clusters'")
