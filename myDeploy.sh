#!/bin/bash

# 默认不执行 clean ssh，并且提交信息为空
CLEAN=false
SSH=false
COMMIT_MSG=""

# 标志位，标记是否在读取提交信息
READING_COMMIT_MSG=false

# 遍历所有传递的参数
for arg in "$@"
do
    if [ "$arg" == "clean" ]; then
        CLEAN=true
    elif [ "$arg" == "ssh" ]; then
        SSH=true
    elif [ "$arg" == "-m" ]; then
        READING_COMMIT_MSG=true
        COMMIT_MSG=""
    elif [ "$READING_COMMIT_MSG" == true ]; then
        # 将 -m 后的参数作为提交信息的一部分
        COMMIT_MSG="$arg"
        READING_COMMIT_MSG=false
    fi
done

# 如果找到 clean 参数，执行 hexo clean
if [ "$CLEAN" == true ]; then
    hexo clean
fi

# 如果找到 ssh 参数，执行 ssh 命令
if [ "$SSH" == true ]; then
    ssh -T git@github.com
fi

# 生成静态文件
hexo g

# 部署到服务器
hexo d

# 执行 Git 操作
if [ -n "$COMMIT_MSG" ]; then
    git add .
    git commit -m "$COMMIT_MSG"
    git push
fi
