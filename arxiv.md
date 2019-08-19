# Tips to arxiv a paper

Arxiving, and distributing in general, can be a pain. Some tips can speed things up quite a bit.

## Comments

Remove them. You don't want people to see them, and arxiv doesn't like them.

```shell
latexpand --empty-comments my_awesome_submission.tex > arxiv/my_awesome_submission.tex
```

## Biblio

Arxiv doesn't read ```.bib```. Include the ```.bbl``` instead, and place it at the same level as your ```my_awesome_submission.tex```. Make sure ```.tex``` and ```.bbl``` have the same name.

## Size

Make sure your sources are < 10MB or more for faster download. You can use mogrify for png and jpeg files (make sure the output is not too blurry), and ghostscript for pdf or ps.

```shell
gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dP DFSETTINGS=/screen -sOutputFile=OUTPUT.pdf INPUT.pdf
```

```shell
mogrify -resize 50% *.png 
```



## Hyperref 

(from stackoverflow)

When you use the document class `article`, arxiv additionally loads by default `Babel`, `hyperref`, `hobsub-hyperref`, `hobsub-generic`, `keyval`, `ifxetex`, `kvoptions`, `url`, `rerunfilecheck`, `nameref`, and `gettitlestring` (all from the `texlive 2011` version).

This means that, oddly enough, arxiv would compile without trouble the following document:

```
\documentclass{article}

\begin{document}

\url{https://tex.stackexchange.com/q/329461/34551}

\end{document}
```

Even if it uses the `\url` macro without loading the `url` or `hyperref` packages. Of course, if you try to compile this document on your installation, you would get an error:

> ! Undefined control sequence.
> l.5 \url

But arxiv processes it just fine, without throwing any error.

Hence, you have two options:

1. **Ignore the error**. It occurs only the first time arxiv compile your document (it compiles it multiple times), and don't impact the rendering. But careful, for this error might hides other problems (cf. [the comments on this thread](https://tex.stackexchange.com/q/251628/34551)).
2. **Remove the hyperref package from your preamble**. This is an odd solution, since you won't be able to compile your document on your installation, but it works, i.e., the document is compiled without throwing an error.




## Upload all you folder tree at once

```shell
zip -r arxiv.zip my_awesome_submission/
```

[![Analytics](https://ga-beacon.appspot.com/UA-91308638-2/github.com/ThibaultGROUEIX/useful-computer-vision-phd-resources/arxiv.md?pixel)](https://github.com/ThibaultGROUEIX/useful-computer-vision-phd-resources/)

## Contribute :)
