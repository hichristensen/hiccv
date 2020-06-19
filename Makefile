
publications.html: publications.bib
	bibtex2html --footer "Generated  `date`" -nodoc -d -r -s acm publications.bib 
	cat publ1.htx publications.html publ2.htx > publ.html
	cat publ1.htx publications_bib.html publ2.htx > publ_bib.html
	mv  publ.html publications.html
	mv  publ_bib.html publications_bib.html

coc-publications.html: publications.bib
	bibtex2html --footer "Generated  `date`" -d -r -s acm publications.bib 
	cat publications.html | sed "s:-->:-->	<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"15\"><tr bordercolor=\"#666666\"><td bgcolor=\"#FFFFFF\">  <table width=\"99%\" border=\"0\"> <tr><td width=\"75%\"><span class=\"style4\"><font size=\"6\" face=\"Arial, Helvetica, sans-serif\">Henrik I. Christensen - Publications</font></span></td> <td width=\"200\"><div align=\"right\"><img src=\"coc-bm.jpg\" width=\"199\" /></div></td></tr></table></td></tr></table><center><img src=\"headerline.png\" width=\"100%\"/></center><p>:" >tmp.html
	cat tmp.html | sed "s*</head>*<style type="text/css"><!-- a { border-bottom: 1px dotted; } a:hover { border-bottom: 1px solid; } body { font: 90%/1.4 Georgia; } h1, h2, h3 { font: bold 90%/1.4 Georgia; } h2 { font-weight: normal;  font-size: 70%;  text-align: right; } p { text-indent: 1em; } p.first, p.new, #side p, blockquote p, blockquote+p { text-indent: 0; } blockquote p, blockquote ol, blockquote ul, #side p, #side ul, p.divider { font-size: 80%; } em.mine { font-style: inherit; } a { text-decoration: none; } a.permalink { font-weight: bold; } ul { list-style-type: none;  list-style-position: inside; } ul li:before { content: "\2022"; }	h1 a, h1 a:hover { border: none } a.permalink {width: 1em; display: block; float: left;    height: 1em;    border: none; } body, h1 a { color: #333; } a, a.permalink, #side a { color: #000; } a {border-color: #a30; } a:hover { color: #f80; border-color: #f30; }body {background: #fff; }em.mine {background: #e6ffbf; }--></style></head>*" > tmp1.html
	sed "s:<td align=\"right\">:<td align=\"right\" width=\"8%\">:" < tmp1.html > coc-publications.html
	rm tmp.html tmp1.html publications.html
	scp coc-publications.html rigel.cc.gatech.edu:www/publications.html
	scp publications_bib.html rigel.cc.gatech.edu:www/
	scp publications.bib rigel.cc.gatech.edu:www/
	rsync -avz -e ssh hic-papers/ rigel.cc.gatech.edu:www/hic-papers/

publtest.pdf: publtest.tex sarticles.bib sbooks.bib sbook-chapters.bib sconf-papers.bib \
	sjournal-issues.bib stheses.bib
	pdflatex publtest
	bibtex publtest1
	bibtex publtest2
	bibtex publtest3
	bibtex publtest4
	bibtex publtest5
	bibtex publtest6
	pdflatex publtest

cv_hic.pdf: cv_hic.tex 
	pdflatex cv_hic
	bibtex cv_hic1
	bibtex cv_hic2
	bibtex cv_hic3
	bibtex cv_hic4
	bibtex cv_hic5
	bibtex cv_hic6
	pdflatex cv_hic

hiccv.pdf: hiccv.tex reports.bib articles.bib conf-papers.bib books.bib 
	pdflatex hiccv
	bibtex hiccv1
	bibtex hiccv2
	bibtex hiccv3
	bibtex hiccv4
	bibtex hiccv5
	bibtex hiccv6
	bibtex hiccv7
	pdflatex hiccv

hiccv.ps: hiccv.tex
	latex hiccv
	bibtex hiccv1
	bibtex hiccv2
	bibtex hiccv3
	bibtex hiccv4
	bibtex hiccv5
	bibtex hiccv6
	bibtex hiccv7
	latex hiccv
	dvips -o hiccv.ps hiccv

publ.pdf: publ.tex 
	pdflatex publ
	bibtex publ1
	bibtex publ2
	bibtex publ3
	bibtex publ4
	bibtex publ5
	bibtex publ6
	bibtex publ7
	pdflatex publ

sarticles.bib: articles.bib
	bib2bib -r -s year articles.bib > sarticles.bib

sjournal-issues.bib: journal-issues.bib
	bib2bib -r -s year journal-issues.bib > sjournal-issues.bib

sbooks.bib: books.bib
	bib2bib -r -s year books.bib > sbooks.bib

sbook-chapters.bib: book-chapters.bib
	bib2bib -r -s year book-chapters.bib > sbook-chapters.bib

sconf-papers.bib: conf-papers.bib
	bib2bib -r -s year conf-papers.bib > sconf-papers.bib

stheses.bib: theses.bib
	bib2bib -r -s year theses.bib > stheses.bib
