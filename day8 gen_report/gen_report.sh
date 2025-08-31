#!/bin/bash

#设置安全选项
set -u                 #使用未定义变量时报错
shopt -s nullglob      #如果目录汇中没有匹配文件，不返回原始模式

#定义日志目录和报告文件路径
LOG_DIR="$HOME/aws_practice/study-2"
REPORT="$HOME/aws_practice/error_report.txt"
   > "$REPORT"          #清空报告文件，避免追加旧数据

#定义函数：统计文件中 “ERROR" 的行数（忽略大小写）
count_error(){
   local file="$1"    #函数参数：传入的文件路径
   local count        #局部变量：错误计数
   count=$(grep -ci "ERROR" "$file")        #grep -ci 统计 ERROR 行数
   echo "$count"
}
    #遍历日志目录下的所有.log 文件
    for f in "$LOG_DIR"/*.log; do
        num=$(count_error "$f")              #调用函数统计错误数
        echo "文件：$(basename "$f") 错误行数：$num" >> "$REPORT" #写入报告文件

done
         #最终对报告按错误数倒序排序，输出到新文件
         sort -k3 -n -r "$REPORT" > "${REPORT%.txt}_sorted.txt"



