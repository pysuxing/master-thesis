all: anon open

anon:
	xelatex thesis-anon
	bibtex thesis-anon
	bibtex thesis-anon
	xelatex thesis-anon
	xelatex thesis-anon

open:
	xelatex thesis
	# makeindex -s nomencl.ist -o thesis.nls thesis.nlo
	bibtex thesis
	bibtex thesis
	xelatex thesis
	xelatex thesis
cls:
	xelatex nudtpaper.ins
	xelatex nudtpaper.dtx
	makeindex -s gind nudtpaper
	makeindex -s gglo -o nudtpaper.gls nudtpaper.glo
	xelatex nudtpaper.dtx
	xelatex nudtpaper.dtx
clean:
	rm -v *.aux *.log *.toc *.ind *.gls *.glo *.idx *.ilg *.out *.bbl *.thm *.blg *.lot *.lof *.pdf *.nls *.nlo
