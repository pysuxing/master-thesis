all: expression-tree.pdf frontend.pdf backend.pdf vp-fusion-1.pdf vp-fusion-2.pdf vp-reorder-1.pdf vp-reorder-2.pdf \
	n-body-core.pdf n-body-stream.pdf np-decomposition.pdf n-body-stream-new.pdf n-body-core-new.pdf

%.pdf: %.dot
	dot -Tpdf -o $@ $^

clean:
	rm -v *~