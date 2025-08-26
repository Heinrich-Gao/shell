#!/bin/bash

total=0

for f in $HOME/aws_practice/*.log;do    #遍历指定目录下的所有.log文件
    count=$(grep -ci "ERROR" "$f")
    echo "$count $f"
    total=$((total += count))    #累加至计数器
done | sort -nr    #将输出按照数字的降序排序
echo "---------------------"
echo "TOTAL ERRORS : $total"    #输出总错误数
