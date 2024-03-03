#!/bin/bash
directory="`echo $HOME`/Pictures/Screenshots"

joinpath() {
    local IFS='/'
    echo "$*"
}

inotifywait -e create -m "$directory" |
while read -r directory events filename; do
  cd $directory
  new_filename=$(echo "$filename" | tr -d ' ')
  filepath=$(joinpath "$directory" "$new_filename")
  echo $new_filename
  mv "$filename" $filepath
  curl -X POST -H "Authorization: `cat ~/.nest/api_key`" \
   -H "Content-Type: multipart/form-data" \
   -F file=@$filepath \
   "https://nest.rip/api/files/upload" | jq -r ".fileURL" | xclip -selection clipboard
done
