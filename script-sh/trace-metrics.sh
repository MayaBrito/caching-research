#!/bin/sh

tmp_working_dir=tmp_working_dir
output_dir=output
irr_dir=$output_dir/irr
footprint_dir=$output_dir/footprint
input_dir=/home/user/trace/name

mkdir -p $tmp_working_dir
mkdir -p $output_dir
mkdir -p $irr_dir
mkdir -p $footprint_dir

function filter_gets() {
    #format original file
    #timestamp,item_key,key_size,value_size,client_id,op_type,TTL
    local input_file=$1
    local filename=$2
    awk -F',' '$6 == "get" || $6 == "gets"' $input_file > $tmp_working_dir/"$filename"_filter.csv
}

function filter_object_id() {

    local input_file=$1
    #format 
    #timestamp,item_key,key_size,value_size,client_id,op_type,TTL
    cut -d"," -f2 "$input_file"_filter.csv > "$input_file"_objects.csv
}

# input_dir deve ser um diretório final só com os files
for file in $(find $input_dir -type f); do

    filename=$(basename $file .sort.zst)

    zstd -d $file 

    sed 's/ \+/,/g' $input_dir/"$filename.sort" > $input_dir/"$filename.csv"

    rm $input_dir/"$filename.sort"

    echo $file $filename

    filter_gets $input_dir/"$filename.csv" $filename
    filter_object_id $tmp_working_dir/$filename

    python3 irr.py < $tmp_working_dir/"$filename"_objects.csv > $irr_dir/"$filename"_irr.txt
    python3 footprint.py < $tmp_working_dir/"$filename"_objects.csv > $footprint_dir/"$filename"_footprint.txt

    rm $input_dir/"$filename.csv"
done
