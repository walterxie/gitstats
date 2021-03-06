# gitstats
use git log to create statistics of contributions

## OS
Mac, Linux

## Preparation

List the number of commits by authors and their emails:
```bash
git shortlog -e -s -n
```
If there are multiple names or wrong names, use `.mailmap` to correct them:
http://git-scm.com/docs/git-check-mailmap

For multiple author filtering, run `git config --global grep.extendedRegexp true` to use extended regex. 
https://forums.freebsd.org/threads/58555/

## Scripts

Sort the list by the number of commits:
```bash
git shortlog -s | sort -nr
```

For a subdirectory:
```bash
git shortlog -s -- src/dr/inference/trace | sort -nr
```

To show the change of files and lines:
```bash
git log --shortstat --author "Name1|Name2" | grep "files\? changed" | awk '{files+=$1; inserted+=$4; deleted+=$6} END {print "files changed:", files, ", lines inserted:", inserted, ", lines deleted:", deleted}'`
```

