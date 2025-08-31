# 日志错误统计脚本 (Log Error Reporter)

## 📌 简介
这是一个基于 **Bash** 的日志分析脚本，功能是遍历指定目录下的所有 `.log` 文件，统计每个文件中包含 **"ERROR"** 的行数，并将结果写入报告文件，最后生成一份 **按错误数倒序排序** 的报告。  

适合用于运维日志分析、错误排查和自动化监控。

---

## 🔧 功能特点
- 遍历指定目录下的所有 `.log` 文件。
- 统计每个文件中包含 `"ERROR"` 的行数（忽略大小写）。
- 结果输出到 `error_report.txt`。
- 自动生成 `error_report_sorted.txt`，内容按错误行数从大到小排序。
- 使用安全选项，避免未定义变量和空文件匹配导致错误。

---

## 🚀 使用方法

### 1. 克隆仓库
```bash
git clone https://github.com/Heinrich-Gao/shell.git
cd shell

