# 日志关键字监控脚本 (day7_monitor.sh)

## 📌 简介
本脚本用于监控某个目录下的 `.log` 文件，统计其中 `error`、`fail`、`warning` 关键字出现的次数。  
它不仅会在终端打印结果，还会将统计信息追加写入到日志文件中，方便后续分析。

---

## 🔧 功能特点
- 遍历指定目录下的所有 `.log` 文件
- 忽略大小写统计 `error` / `fail` / `warning` 出现的次数
- 输出每个文件的详细统计结果
- 将结果追加写入 `$HOME/aws_practice/day7_monitor.log` 日志文件
- 跳过不可读或不存在的文件

---

## 🚀 使用方法

### 1. 赋予执行权限
```bash
chmod +x day7_monitor.sh
