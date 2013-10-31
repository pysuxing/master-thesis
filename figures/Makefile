all: *.png

%.png: %.dot
	dot -Tpng -o $@ $^

clean:
	rm -v *~