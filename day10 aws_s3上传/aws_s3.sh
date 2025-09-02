#!/bin/bash
#遍历目标目录并将文件逐个上传至S3桶
DIR="$HOME/aws_practice/study-2"    #根据实际路径随时更改
BUCKET="heinrich-study-bucket-1"    #根据实际桶名随时更改

#遍历 "$DIR" 中的所有内容
for f in "$DIR"/*;do
    #将检索到的文件上传至S3桶
    aws s3 cp "$f" s3://$BUCKET/
    echo "上传完成：$(basename "$f")"
done
