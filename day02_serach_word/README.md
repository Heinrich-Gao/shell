# search_word.sh 脚本说明

这个脚本是我在学习 Shell 编程过程中完成的练习任务，主要用于统计指定目录下 `.txt` 文件中某个单词出现的次数。

---

## 🛠 脚本功能

1. 接收一个单词作为参数。
2. 遍历指定目录（例如 `~/aws_practice/`）下的所有 `.txt` 文件。
3. 使用 `grep` 和 `wc -l` 统计每个文件中单词出现的次数。
4. 将统计结果输出到终端。

---

## 📋 脚本示例

```bash
#!/bin/bash

# 将第一个参数赋值给变量 a
a=$1

# 遍历指定目录下的 .txt 文件
for f in ~/aws_practice/*.txt
do
    # 统计单词出现次数
    count=$(grep -o "$a" "$f" | wc -l)
    
    # 输出结果
    echo "在 $f 中，$a 出现了 $count 次"
done
🔹 使用方法
1、给脚本添加执行权限：
chmod +x search_word.sh
2、运行脚本并传入要查找的单词：
./search_word.sh 想查找的单词


