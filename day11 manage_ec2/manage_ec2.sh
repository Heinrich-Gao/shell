#!/bin/bash

#判断传入的EC2实例是否存在，如果存在输出实例ID；如果不存在，则使用指定 AMI 创建一个新的 EC2 实例并打上 Name 标签。

#获取命令行的第一个参数作为实例名称
INSTANCE_NAME=$1
#使用AWS CLI 查询实例ID
INSTANCE_ID=$(aws ec2 describe-instances \
--filters "Name=tag:Name,Values=$INSTANCE_NAME" \    #按照标签Name 筛选实例
--query "Reservations[].Instances[].InstanceId" \    #只提取 InstanceId
--output text)
#指定要使用的 AMI ID
AMI_ID="ami-096566f39a31a283e"

#判断实例是否存在
if [ -n "$INSTANCE_ID" ]; then
   echo "实例 $INSTANCE_NAME 已经存在，ID：$INSTANCE_ID"
else
   echo "未找到名为 $INSTANCE_NAME 的实例"
   #如果不存在则使用AWS CLI 创建实例
   aws ec2 run-instances \
  --image-id "$AMI_ID" \        #指定AMI
  --count 1 \                   #创建1个实例
  --instance-type t3.micro \    #指定实例类型
  --key-name my-key \           #指定SSH 密钥对
  --security-group-ids sg-0deb2241624b13fee \    #安全组 ID
  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME}]"    #给实例打上 Name 标签，便于管理
    echo "已创建名为 $INSTANCE_NAME 的实例"
fi
