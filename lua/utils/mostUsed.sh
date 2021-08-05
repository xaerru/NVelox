#!/bin/bash
# Find the most used file extension in a directory
DIR=$1
git -C $DIR rev-parse 2>/dev/null
if [ $(echo $?) -ne 0 ]; then
    # Not a git repo
    filetype=$(find $DIR -type f -not -path '*/\.*' -not -path '*/\node_modules/*' -not -path '*/\target/*' | awk -F/ '{print $NF}' | awk -F\. '{print $2}' | /bin/grep -v '^$' | sort | uniq -c | sort -nr | awk '{print $2}' | head -n1)
    echo -n $filetype
else
    # A git repo
    cd $DIR
    filetype=$(git ls-files | awk -F/ '{print $NF}' | awk -F\. '{print $2}' | /bin/grep -v '^$' | sort | uniq -c | sort -nr | awk '{print $2}' | head -n1)
    echo -n $filetype
fi
