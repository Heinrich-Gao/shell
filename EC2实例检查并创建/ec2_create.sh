#!/bin/bash

# 脚本功能：
# 1. 从输入文件逐行读取实例名称
# 2. 检查每个名称是否已经存在对应的 EC2 实例
# 3. 如果不存在，使用指定参数创建实例
# 4. 等待实例进入 running 状态后输出结果
# 适合批量创建多个 EC2 实例，避免重复创建

# ======== 配置区域（可按需修改） ========
REGION="us-east-2"              #AWS 区域
AMI_ID="ami-01810692271ee44a4"  #指定的AMI ID (镜像ID)
INSTANCE_TYPE="t3.micro"        #实例类型
KEY_NAME="my-key"               #SSH密钥名称
SG_ID="sg-0deb2241624b13fee"    #安全组ID
INPUT_FILE="./instances.txt"    #存放实例名称的文件

#检查输入文件是否存在
if [ ! -f "$INPUT_FILE" ]; then
    echo "错误：找不到 $INPUT_FILE,请确认文件存在"
    exit 1    #如果文件不存在则脚本退出，避免后续报错
fi

# ===== 逐行读取实例名称 =====
while IFS= read -r NAME; do    #IFS=的作用是保留输入行的原始空白。例如：空格等。
    # 跳过空行;-z用来判断NAME中的字符串是否为空，若为空(&&,前一个命令返回成功运行下一个命令)则运行continue，跳过本次循环
    [ -z "$NAME" ] && continue
    echo "检查实例：$NAME"
       # 使用 AWS CLI 查询是否有同名实例
      EXISTING_INSTANCE=$(aws ec2 describe-instances \
        --region "$REGION" \
        --filters "Name=tag:Name,Values=$NAME" "Name=instance-state-name,Values=pending,running,stopping,stopped" \
        --query "Reservations[*].Instances[*].InstanceId" \
        --output text)

#如果检查结果非空，说明存在同名实例，直接跳过
if [ -n "$EXISTING_INSTANCE" ]; then
        echo "⚠️  已存在同名实例：$NAME (InstanceId: $EXISTING_INSTANCE)，跳过创建"
        continue
    fi

    echo "✅ 未找到同名实例，准备创建：$NAME"
   #使用 AWS CLI 创建新实例，并返回 InstancdID
   INSTANCE_ID=$(aws ec2 run-instances \
        --region "$REGION" \
        --image-id "$AMI_ID" \
        --count 1 \
        --instance-type "$INSTANCE_TYPE" \
        --key-name "$KEY_NAME" \
        --security-group-ids "$SG_ID" \
        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$NAME}]" \
        --query "Instances[0].InstanceId" \
        --output text)
      #$? 表示上一条命令是否成功(0 表示成功，非0表示失败)
      if [ $? -eq 0 ]; then
        echo "🎉 成功创建实例：$NAME"
    aws ec2 wait instance-running \
        --region "$REGION" \
        --instance-ids "$INSTANCE_ID"

    echo "✅ 实例 $NAME 已经进入 running 状态"
    else
        echo "❌ 创建实例失败：$NAME"
    fi
done < "$INPUT_FILE"
