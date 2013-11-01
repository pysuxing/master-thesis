all: expression-tree.pdf

%.pdf: %.dot
	dot -Tpdf -o $@ $^

clean:
	rm -v *~