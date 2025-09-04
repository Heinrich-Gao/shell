#!/bin/bash

total=0

#遍历study-2目录
for f in study-2/*;do
    count=$(grep -ci "ERROR" "$f")    #统计目录文件中的ERROR
    echo "$f : $count"
    total=$((total+count))            #统计目录文件中ERROR共有几行
done
echo "TOTAL_ERRORS: $total"

#将study-1目录压缩
tar -czf study-1_backup.tar.gz study-1
#将压缩包上传至S3桶
aws s3 cp "$HOME/aws_practice/study-1_backup.tar.gz" s3://heinrich-study-bucket/ \
  && echo "上传成功：study-1_backup.tar.gz 已上传至 S3 桶" \
  || echo "上传失败，请检查网络或 S3 桶名称或压缩包是否存在"
