
ifeq ($(DEBUG),true)
CC = $(COMPIRE_FLAG) -g
VERSION = debug
else
CC = $(COMPIRE_FLAG)
VERSION = release
endif

# 扫描当前目录下所有.cxx文件
SRCS = $(wildcard *.cxx)

#将SRCS 中的.cxx 换为.o
OBJS = $(SRCS:.cxx=.o)

DEPS = $(SRCS:.cxx=.d)

#生成二进制文件的路径
BIN := $(addprefix $(BUILD_BIN)/,$(BIN))

#目标文件与依赖文件的目录
LINK_OBJ_DIR = $(BUILD_DIR)/obj
DEP_DIR = $(BUILD_DIR)/dep

$(shell mkdir -p $(LINK_OBJ_DIR))
$(shell mkdir -p $(DEP_DIR))
$(shell mkdir -p $(BUILD_BIN))

OBJS := $(addprefix $(LINK_OBJ_DIR)/,$(OBJS))
DEPS := $(addprefix $(DEP_DIR)/,$(DEPS))

#获取当前生成的所有.o文件
LINK_OBJ = $(wildcard $(LINK_OBJ_DIR)/*.o)

#当前依赖的.o为包含，在这里进行增加
LINK_OBJ += $(OBJS)


#入口
all:$(DEPS) $(OBJS) $(BIN)

ifneq ("$(wildcard $(DEPS))","")   #如果不为空,$(wildcard)是函数【获取匹配模式文件名】，这里 用于比较是否为""
include $(DEPS)  
endif

$(BIN):$(LINK_OBJ)
	@echo "build $(VERSION) mode"

	$(CC) -o $@ $^ $(BUILD_FLAG)

$(LINK_OBJ_DIR)/%.o:%.cxx
	$(CC) -I$(INCLUDE_PATH) -o $@ -c $(filter %.cxx,$^)


$(DEP_DIR)/%.d:%.cxx

	echo -n $(LINK_OBJ_DIR)/ >$@
	$(CC) -I$(INCLUDE_PATH) -MM $^ >> $@