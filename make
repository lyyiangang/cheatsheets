# makefile 使用示意
target=test
all:${target}
# SRCS = $(wildcard *.cpp)
# $(info ${SRCS})
src=kdtree.cpp kdtree.h dbscan.hpp test_dbscane.cpp
LIB = -L./libs -ltomcrypt
CFLAGS = -Wall -O2 --std=c++11

${target}:${src}
	g++ -o ${target} ${src} -I . ${CFLAGS}

clean:
	rm ${target}

run:${target}
	./test
