# 使用make自动根据latex文本以及数据的变化生成pdf
# 依赖链: .dat -> .png -> 
#                 .tex -> .pdf    
paper.pdf: paper.tex plot-data.png
    pdflatex paper.tex
plot-%.png: %.dat plot.py
    python plot.py -i $*.dat -O $@
