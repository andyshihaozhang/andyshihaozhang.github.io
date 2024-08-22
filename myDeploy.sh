#!/bin/bash

# 默认不执行 clean ssh
CLEAN=false
SSH=false

# 遍历所有传递的参数
for arg in "$@"
do
    if [ "$arg" == "clean" ]; then
        CLEAN=true
        break
    fi
	if [ "$arg" == "ssh" ]; then
        SSH=true
        break
    fi
done

# 如果找到 clean 参数，执行 hexo clean
if [ "$CLEAN" == true ]; then
    hexo clean
fi

# 如果找到 clean 参数，执行 hexo clean
if [ "$SSH" == true ]; then
    ssh -T git@github.com
fi

# 生成静态文件
hexo g

# 部署到服务器
hexo d
