---
title: hexo+gitblog搭建记录
date: 2024-08-20 10:16:57
tags: 运维
---

##  1 - git部署绑定域名

转载：https://jacckx.me/2021/02/28/Hexo_Custom_Domain/

## 2 - butterfly魔改教程

转载：https://www.fomal.cc/posts/eec9786.html

## 3 - hexo博客迁移

当前方案转载：https://blog.csdn.net/K1052176873/article/details/122879462

完美方案转载：https://www.alankeene.com/2019/0102/hexo-perfect-synchronize.html

## 4 - hexo新环境安装失败

清除原代理

```shell
npm config set proxy null
npm config set https-proxy null
```

查看代理是否为null

```shell
npm config get proxy
npm config get https-proxy
```

安装cnpm环境

```shell
npm install -g cnpm --registry=https://registry.npm.taobao.org
```

安装hexo

```shell
cnpm install hexo-cli -g
```

若出现如下图状态

![image-20240903100028185](hexo-gitblog搭建记录\image-20240903100028185.png)

执行

```shell
npm install
```

