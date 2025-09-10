#!/bin/bash

# count_error 函数：统计文件中 ERROR 行数,找出错误行最多的文件，提示需要重点关注

#count_error 函数：统计文件中包含 ”ERROR" 的行数（不区分大小写）
count_error() {
    local file="$1"      #取调用函数时传进来的第 1 个参数
    local count          #用于存储统计结果
    count=$(grep -ci "ERROR" "$file")    #统计匹配行数
    echo "$count"
}

#初始化两个变量，用于存储最大错误数及对应文件
max_count=0    #当前发现的最大错误行数
max_file=0     #错误最多的文件名

TXT_DIR="$HOME/aws_practice/study-1"    #定义要扫描的目录

#遍历目录下所有的 .txt 文件
for f in "$TXT_DIR"/*.txt; do
    num=$(count_error "$f")    #调用函数，统计该文件的 error 行数
    echo "文件：$(basename "$f") 错误行数：$num"

    if [ "$num" -gt "$max_count" ]; then    #如果该文件错误数大于当前最大值，就更新最大值和对应文件
     max_count=$num
     max_file=$(basename "$f")
     fi 
done

#最终结果输出
if [ "$max_count" -gt 0 ];then
    #如果发现至少一个文件存在错误，则输出错误最多的文件
    echo "需要重点关注：$max_file,错误行数：$max_count"
else
    #如果没有文件包含 “ERROR" ，给出提示
    echo "所有文件无 ERROR 行，暂时无需重点关注"
fi
