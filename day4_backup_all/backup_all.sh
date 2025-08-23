#!/bin/bash
#DAY4--自动化备份----遍历study-2并按日期打包

S="$HOME/aws_practice/study-2"  #要备份的源目录
D="$HOME/aws_practice/study-1"  #输出目录（放压缩包）
R="$(date +%Y%m%d)"             #当前日期；某年某月某日
mkdir -p "$D"                   #若输出目录不存在则创建该目录

for dir in "$S"/*/; do          #遍历源目录下的所有子目录
    name="$(basename "$dir")"   #提取子目录名
    echo "发现目录：$name"
    outfile="$D/backup_${R}_${name}.tar.gz" #定义压缩包的完整路径和名称
   #使用tar命令压缩目录
   #-c 创建新归档
   #-z 使用gzip压缩
   #-f 指定输出的文件名
   #-C 切换到源目录下打包，确保压缩包内路径为子目录名而不是完整路径
   tar -czf "$outfile" -C "$S" "$name"
   if [ $? -eq 0 ]; then    #判断tar命令是否运行成功
   echo "[$(date '+%F %T')] ✅ 目录 $name 备份成功 -> $outfile"
else
   echo "[$(date '+%F %T')] ❌ 目录 $name 备份失败"
  fi
done 

