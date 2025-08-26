#!/bin/bash

#遍历指定目录下的所有.txt文件，逐行读取文件内容并在发现”error“后，输出提示
shopt -s nullglob    #如果没有匹配文件，则循环不会执行

#定义要遍历的目录
L="$HOME/aws_practice/study-1"

    for f in "$L"/*.txt    #遍历该目录下的所有.txt文件
do
    echo "正在处理文件：$f"

   while IFS= read -r line; do    #使用循环来逐行读取文件内容
         echo "读到一行：$line"
  
   if [[ "$line" == *error* ]]; then    #检查当前行是否有“error”字符串
       echo "这一行有 error -> $line"
   fi
   done < "$f"    #将当前文件作为输出传递给while循环
done
