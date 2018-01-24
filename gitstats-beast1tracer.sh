#bash

# go to the dependent code
cd ~/WorkSpace/beast1

# correct names
git shortlog -e -s -n > mailmap
mv mailmap .mailmap

# list the number of commits by authors for 2 subdirectories
git shortlog -s -- src/dr/app/gui/chart src/dr/inference/trace | sort -nr 

# loop through authors
declare -a authors=("Andrew Rambaut" "Walter Xie" "Guy Baele" "Marc Suchard" "Alexei Drummond")
for a in "${authors[@]}"
do
   echo "$a"
   # show the change of files and lines
   # not sure if it is bug using 2 subdirectories here, the numbers are strange
   git log --shortstat --author "$a" -- src/dr/app/gui/chart | grep "files\? changed" | awk '{files+=$1; inserted+=$4; deleted+=$6} END {print "files changed:", files, ", lines inserted:", inserted, ", lines deleted:", deleted}'
   git log --shortstat --author "$a" -- src/dr/inference/trace | grep "files\? changed" | awk '{files+=$1; inserted+=$4; deleted+=$6} END {print "files changed:", files, ", lines inserted:", inserted, ", lines deleted:", deleted}'
done
