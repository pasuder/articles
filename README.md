# Articles

And not only..

[![Build Status](https://travis-ci.org/pasuder/articles.svg?branch=master)](https://travis-ci.org/pasuder/articles)

Some of articles might be written in Polish.

# Usage

Before you start, ensure that you have installed software. For Debian based Linux distributions, you can execute following command:

```bash
sudo apt-get install -y --no-install-recommends pandoc pandoc-citeproc gnuplot texlive texlive-latex-recommended texlive-latex-extra lmodern
```

Next, start your own article:

```bash
mkdir your-article-title
touch your-article-title/article.{md,bibtex}
```

Edit `your-article-title/article.md` like [`example-article/article.md`](example-article/article.md).

If needed, add BiBTex entries to `your-article-title/article.bibtex`.

If you want to have _gnuplot_ charts, create files with prefix `chart` and extension `.dem` in `your-article-title`
directory, like [example chart](example-article/chart-01.dem) or [another example chart](example-article/chart-02.dem).

Run `./build.sh` in this directory from console.
