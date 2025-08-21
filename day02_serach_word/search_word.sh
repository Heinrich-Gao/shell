#!/bin/bash

#将第一个参数赋值给a
a=$1

#遍历目标目录内的所有.txt文件；通过更改“~/aws_practice"来更换查找的目录
for f in ~/aws_practice/*.txt
do

    #统计次数并输出结果
    echo "在 $f 中，$a 出现了 $(grep -o "$a" "$f" | wc -l) 次"
done
