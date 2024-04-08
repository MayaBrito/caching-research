#!/bin/sh                                                            

DATASET_URL="https://example.com/data"
BUCKET_NAME="bucket-name"
DATA_NAME="data-name"

# Ensure bucket exists
if [[ ! $(swift list | grep -q $BUCKET_NAME) ]]; then
    openstack container create $BUCKET_NAME
fi

for i in $(seq 1 54); do
	FILE_NAME=$DATA_NAME$i
	echo $FILE_NAME
	wget $DATASET_URL/cluster$i.sort.zst -O /tmp/$FILE_NAME

	cd /tmp

	swift upload $BUCKET_NAME -S 3221225472 $FILE_NAME

	rm /tmp/$FILE_NAME
done
