```
$ cat text.txt | awk 'BEGIN {RS = " |\n"}; {printf "penis "}; END {print ""}'
```
or
```
$ awk 'BEGIN {RS = " |\n"}; {printf "penis "}; END {print ""}' text.txt
```
or
```
$ awk -f penis.awk text.txt
```
