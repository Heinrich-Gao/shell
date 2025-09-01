# 按文件类型压缩脚本 (File Type Compressor)

## 📌 简介
这是一个基于 **Bash** 的小工具脚本，用于遍历指定目录下的文件，并按文件类型生成独立的压缩包。  
当前版本支持 `.txt` 和 `.log` 文件，每种类型单独打包。  

适合用于：
- 日志归档
- 文本文件备份
- 实验数据整理

---

## 🔧 功能特点
- 自动判断指定目录下是否存在 `.txt` 和 `.log` 文件。  
- 对存在的文件进行压缩打包，生成独立的 `.tar.gz` 文件：
  - `txt_files.tar.gz`
  - `log_files.tar.gz`
- 如果目录下没有该类型文件，自动提示无需打包。  
- 输出压缩前后提示信息，方便用户跟踪操作。  

---

## 🚀 使用方法

### 1. 克隆仓库
```bash
git clone https://github.com/Heinrich-Gao/shell.git
cd shell
