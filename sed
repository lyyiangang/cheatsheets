# -n: close automatic print, no prit anly thing
# /p: print match string(grouped)

# 获取进程id(ps -axu) 65521
echo "jianyin+ 65521 0.0 16448 524 pts" | sed -nE 's/\w+\+? ([0-9]+).*/\1/p'

# To replace all occurrences of "day" with "night" and write to stdout:
sed 's/day/night/g' <file>
# replace '/' in path to '#'
sed 's/\//#/g' $PWD

# To replace all occurrences of "day" with "night" within <file>:
sed -i 's/day/night/g' <file>

# To replace all occurrences of "day" with "night" on stdin:
echo 'It is daytime' | sed 's/day/night/g'

# To remove leading spaces:
sed -i -r 's/^\s+//g' <file>

# To remove empty lines and print results to stdout:
sed '/^$/d' <file>

# To replace newlines in multiple lines:
sed ':a;N;$!ba;s/\n//g' <file>

# To insert a line before a matching pattern:
sed '/Once upon a time/i\Chapter 1'

# To add a line after a matching pattern:
sed '/happily ever after/a\The end.'

# extract digital from string. Warning, 
# sed use [0-9] match digital number. 
# \1 means the first match object. 
echo "age:30"  | sed -nE "s/.*:([0-9])/\1/p"  # print '30'

# 在列表中每过30行取一行
sed -n '1~30p' mylist.txt

#如下命令打印1~5行与第9行.
sed -n '1,5p;9p' test.txt

# delete invalide docker images
#$ docker images
# pytorch/pytorch <none>   e372     17 months ago    22GB
# pytorch/pytorch latest   e38     80 moth ago       30GB
docker images | grep pytorch | sed -nE 's/.*(>|latest)\s+(\w+).*/\2/p' | xargs -i docker image rm {} 

