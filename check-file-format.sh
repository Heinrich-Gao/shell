#!/bin/bash
#查询aws_practice目录中的".txt"文件
files=$(find ~/aws_practice -name "*.txt")    #find命令查找所有符合条件的文件并将结果保存到files
if [ -n "$files" ];then    # 如果files非空（找到了文件）
    for f in $files        #遍历每个文件，将当前文件名赋值给f
do
    echo "找到文件：$f"    #打印当前文件名
    head -n 1 "$f"         # 查找第一行内容
        done               #循环结束 
else
   echo "没有找到文件"     # 如果没有找到文件给出提示
fi                         # if条件判断结束
