# makeProject
使用makefile实现的linux下 c++构建工具

## 依赖环境
- make 
- g++
- linux (非必须，windwos下有linux环境也可以使用)

## 介绍
此构建项目主要由3个makefile文件组成：
- 管理配置的config.mk
- 公共构建模块common.mk
- 构建入口makefile

config.mk定义了整个项目共用的变量

common.mk是构建核心模块，定义了构建目录的依赖

## 使用
请按照此项目的方式去使用，当新建一个目录时，需要在新建目录创建文件makefile
内容如下
```
BIN = 
BUILD_FLAG = 
include $(PROJECT_DIR)/common.mk
```
1. 若当前目录是生成可执行文件的目录（构建的最后一个目录），需要赋值BIN=XXX，如demo中的test目录，此时生成的可执行文件名字就为XXX.
2. BUILD_FLAG 是用来扩展静态连接,如-lpthread
3. include $(PROJECT_DIR)/common.mk 进行构建

## 生成
- build/ 目录存放构建生成的文件。
- build/dep目录存放依赖文件。
- build/obj存放目标文件。
- build/bin存放最后生成的文件
## TODO
此项目不定时更新。下个版本会将头文件改到各自的目录，这样会更方便。