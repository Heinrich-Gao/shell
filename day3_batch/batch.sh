#!/bin/bash


A="$HOME/aws_practice/study-1"    #将路径赋值到A
S="$HOME/aws_practice/study-2"    #将路径赋值到S
mkdir -p "$S"                     #若是没有$S则创建一个目录，有则保留

for f in "$A"/*.txt               #遍历路径$A中所有.txt文件，并赋值到f
do
    mv "$f" "$S"                  #将$f中的.txt文件移动到$S中
    echo "已移动 $f 到 $S"
    filename="$(basename "$f")"
    filepath="$S/$filename"
    if [ ! -s "$filepath" ]; then    #检查路径$filepath中的文件是否为空
    rm "$filepath"                   #为空则删除空文件
    echo "$filename 是空文件已删除"
else
    echo "$filename 有内容已保留"
   fi
done
