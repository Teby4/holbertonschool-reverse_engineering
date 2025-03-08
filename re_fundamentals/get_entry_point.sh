#!/bin/bash

source ./messages.sh

file_name="$1"

if [[ ! -f "$file_name" ]]; then
    echo "Error: File '$file_name' does not exist."
    exit 1
fi

if ! file "$file_name" | grep -q "ELF"; then
    echo "Error: '$file_name' is not a valid ELF file."
    exit 1
fi

magic_number=$(readelf -h $file_name | grep Magic: | awk '{ $1=""; sub(/^ /, ""); print }')
class=$(readelf -h $file_name | grep Class: | awk '{ $1=""; sub(/^ /, ""); print }')
byte_order=$(readelf -h $file_name | grep Data: | awk '{ $1=$2=$3=""; sub(/^[ \t]+/, ""); print }')
entry_point_address=$(readelf -h $file_name | grep "Entry point address:" | awk '{print $4}')

display_elf_header_info
