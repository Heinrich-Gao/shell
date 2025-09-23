#!/bin/bash

# 功能说明：
#   本脚本用于监控指定目录下的 .log 文件，统计每个日志文件中
#   "error"、"fail"、"warning" 关键字出现的次数，并将结果记录到日志文件中。
#
# 使用方法：
#   ./day7_monitor.sh <日志目录>
#
# 参数说明：
#   $1 -> 要检查的目录路径
#
# 输出：
#   1. 在终端打印每个文件的关键字统计结果
#   2. 在 $HOME/aws_practice/day7_monitor.log 文件中追加记录

DIR=$1                                        #要检查的目录（由用户输入）
LOGFILE="$HOME/aws_practice/day7_monitor.log" #输出日志文件
TIME=$(date "+%Y-%m-%d %H:%M:%S")             #当前时间戳

  for f in "$DIR"/*.log
do
  #检查文件是否存在且可读
  if [ -e "$f" ] && [ -r "$f" ]; then
total=0
#遍历关键字并统计
for k in error fail warning; do
    count=$(grep -oi "$k" "$f" | wc -l)
    total=$((total + count))
    echo "  $k: $count 次"
      #分别保存单独的统计值
      if [ "$k" = "error" ]; then error_count=$count; fi
      if [ "$k" = "fail" ]; then fail_count=$count; fi
      if [ "$k" = "warning" ]; then warning_count=$count; fi
done
echo " 总计： $total 次"
# 将结果写入日志文件（追加模式 >>）
echo "[$TIME] 文件 $f 检查结果 -> ERROR:$error_count, FAIL:$fail_count, WARNING:$warning_count, 总计:$total" >> "$LOGFILE"
fi
done
