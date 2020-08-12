include config.mk
all:
#make -C 指定目录
#可执行文件应该方到最后
	@for dir in $(NEED_BUILD_DIRS); \
	do\
		make -C $$dir;\
	done

clean:
	rm -rf $(BUILD_DIR)