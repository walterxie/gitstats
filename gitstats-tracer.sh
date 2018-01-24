#bash

# go to the repository
cd ~/WorkSpace/tracer

# list the number of commits by authors and their emails
git shortlog -s | sort -nr 

# loop through authors
declare -a authors=("Andrew Rambaut" "Walter Xie" "Guy Baele" "Marc Suchard" "Alexei Drummond")
for a in "${authors[@]}"
do
   echo "$a"
   # show the change of files and lines
   git log --shortstat --author "$a" | grep "files\? changed" | awk '{files+=$1; inserted+=$4; deleted+=$6} END {print "files changed:", files, ", lines inserted:", inserted, ", lines deleted:", deleted}'
done
