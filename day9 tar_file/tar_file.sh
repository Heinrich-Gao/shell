#!/bin/bash
#遍历目标文件夹，按文件类型生成压缩包（txt单独一个包，log单独一个包）

DIR="$HOME/aws_practice/study-2"

#判断目标目录中是否存在 txt 文件，并将标准输出和标准错误丢入“黑洞”
if ls "$DIR"/*.txt 1>/dev/null 2>&1;then
    echo "发现 txt 文件，可以压缩打包"
    #将 txt 文件打包压缩至 txt_files.tar.gz
    tar -czf "$HOME/aws_practice/txt_files.tar.gz" "$DIR"/*.txt
    echo "文件压缩完成：txt_files.tar.gz"
else
    echo "没有 txt 文件，无需打包"
fi
#判断目标目录中是否存在 log 文件，并将标准输出和标准错误丢入“黑洞”
if ls "$DIR"/*.log 1>/dev/null 2>&1; then
    echo "发现 log 文件，可以打包压缩"
    #将 log 文件打包压缩至 log_files.tar.gz
    tar -czf "$HOME/aws_practice/log_files.tar.gz" "$DIR"/*.log
    echo "文件压缩完成：log_files.tar.gz"
else
    echo "没有 log 文件，无需打包"
fi
