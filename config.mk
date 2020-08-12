
#项目根目录
export PROJECT_DIR = $(shell pwd)
#项目构建目录
export BUILD_DIR = $(PROJECT_DIR)/build
#二进制生成目录
export BUILD_BIN = $(BUILD_DIR)/bin

#头文件路径变量
export INCLUDE_PATH = $(PROJECT_DIR)/include

#定义编译目录
#需要注意可执行程序必须放到最后
NEED_BUILD_DIRS = $(PROJECT_DIR)/add/ \
            $(PROJECT_DIR)/sub/ \
            $(PROJECT_DIR)/test/ 

#是否生成调试信息
export DEBUG = true

#编译器 在此调整c++版本
export COMPIRE_FLAG = g++ -std=c++11