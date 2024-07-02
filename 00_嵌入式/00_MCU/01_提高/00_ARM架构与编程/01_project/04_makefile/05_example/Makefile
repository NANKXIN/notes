objs = a.o b.o c.o

dep_files := $(patsubst %, .%.d, $(objs)) # 符合 % 的变量都变成 .%.d（即时变量）
dep_files := $(wildcard $(dep_files))  		# 取出真实存在的文件（即时变量）

CFLAGS = -Werror -Iinclude

test: $(objs)
	gcc -o test $^

ifneq ($(dep_files),)  # 如果 dep_files 不为空
include $(dep_files)   # 包含 dep_files
endif

%.o: %.c
	gcc $(CFLAGS) -c -o $@ $< -MD -MF .$@.d

clean:
	rm *.o test
distclean:
	rm $(dep_files)  #删除所有依赖文件

.PHONY: clean