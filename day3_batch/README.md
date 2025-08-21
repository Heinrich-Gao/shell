# Batch File Mover & Cleaner

## 脚本文件
`batch.sh`

## 功能
该脚本用于批量处理文件，主要完成以下任务：
1. 遍历指定目录（`study-1`）下的所有 `.txt` 文件。
2. 将这些文件移动到目标目录（`study-2`）。
3. 检查每个文件是否为空：
   - 如果为空，则删除该文件。
   - 如果有内容，则保留。
4. 打印每一步操作的结果，方便查看处理情况。

## 使用方法
1. 确保你的目录结构类似：
~/aws_practice/study-1/ # 源目录
~/aws_practice/study-2/ # 目标目录（脚本会自动创建）
2. 给脚本执行权限：
```bash
chmod +x batch.sh
3.运行脚本：
./batch.sh
脚本解析
A="$HOME/aws_practice/study-1"    # 源目录路径
S="$HOME/aws_practice/study-2"    # 目标目录路径
mkdir -p "$S"                     # 如果目标目录不存在则创建

for f in "$A"/*.txt                # 遍历源目录下的所有.txt文件
do
    mv "$f" "$S"                  # 移动文件到目标目录
    echo "已移动 $f 到 $S"
    filename="$(basename "$f")"   # 获取文件名，不含路径
    filepath="$S/$filename"       # 拼接目标文件完整路径
    if [ ! -s "$filepath" ]; then  # 判断文件是否为空
        rm "$filepath"             # 删除空文件
        echo "$filename 是空文件已删除"
    else
        echo "$filename 有内容已保留"
    fi
done

