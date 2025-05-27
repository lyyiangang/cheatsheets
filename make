# 使用make自动根据latex文本以及数据的变化生成pdf
# 依赖链: .dat -> .png -> 
#                 .tex -> .pdf    
paper.pdf: paper.tex plot-data.png
    pdflatex paper.tex
plot-%.png: %.dat plot.py
    python plot.py -i $*.dat -O $@
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