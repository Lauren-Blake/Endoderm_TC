<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [ashlar: A workflow template for statistical computing projects](#ashlar-a-workflow-template-for-statistical-computing-projects)
- [Making your own ashlar](#making-your-own-ashlar)
  - [Cloning [*ashlar*](http://github.com/jhsiao999/ashlar)](#cloning-ashlarhttpgithubcomjhsiao999ashlar)
  - [Reset git remote directory](#reset-git-remote-directory)
  - [Producing and publishing the website](#producing-and-publishing-the-website)
    - [Option 1: All content for my eyes only](#option-1-all-content-for-my-eyes-only)
    - [Option 2: Publish it! Keep a two-branch workflow.](#option-2-publish-it-keep-a-two-branch-workflow)
- [Resources](#resources)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->



## ashlar: A workflow template for statistical computing projects

[*ashlar*](http://github.com/jhsiao999/ashlar) is our attempt to streamline workflow and to do reproducible research here at the University of Chicago [Stephens Lab](http://stephenslab.uchicago.edu/). 



## Making your own ashlar

### Cloning [*ashlar*](http://github.com/jhsiao999/ashlar) 

[*ashlar*](http://github.com/jhsiao999/ashlar) is inspired by [*singleCellSeq*](https://github.com/jdblischak/singleCellSeq) - a collaborative project between biologists, bioinformaticians and statisticians that aim at exploring and understanding batch effects in single-cell RNA sequencing data. Both projects adopt the popular [*rmarkdown*](http://rmarkdown.rstudio.com/) website layout.

I suggest cloning into a new folder to distinguish your work from the example repository.

```
git clone https://github.com/jhsiao999/ashlar.git ashlar-trial
```



### Reset git remote directory 

At this point, your remote directory of the clone is still [*ashlar*](http://github.com/jhsiao999/ashlar). Make sure you change the name of the remote repository to match your local directory.

```
git remote rm origin
git remote add origin https://github.com/jhsiao999/ashlar-trial.git
```

Create a repository at [*github.com*](http://github.com). Then, push contents of the entire directory to the *master* branch. We use *git add -f* option to force add *html* files to the master branch, such as *index.html* for table of content. The default *.gitignore* in [*ashlar*](http://github.com/jhsiao999/ashlar) ignores *htmls*. 

```
git add -f --all
git commit -m "first commit"
git push origin master
```



### Producing and publishing the website 

#### Option 1: All contents for my eyes only

Open index.html. This is the homepage of your unpubished website. You are DONE!

If you choose this option, you only have the master branch. The *gitignore* is set up to not to push *htmls, pngs, pdfs, etc* to the remote *master* brach, so edit the *.gitignore* to add these files if you want to add them to the remote directory. 


#### Option 2: Publish it! Keep a two-branch workflow.

Copy the master branch into a new branch named gh-pages. 

```
git checkout -b gh-pages 
```

Use knitr to turn Rmds into htmls. I mostly use RStudio to render Rmds. Sometimes *make*
file is useful for reproducing a large number of htmls or for rendering Rmds under
customized options.

```
cd analysis
make
```

Add files to git index and record changes in the local repository.

```
git add -f --all
git commit -m "Build site"
```

Update remote repository with the local changes.

```
git push origin gh-pages
```


The site address is under the analysis directory since the contents are under the analysis directory.

*https://jhsiao999.github.io/ashlar-trial/analysis*


This two-branch workflow is set up to keep the source files (such as *Rmds*) 
separate from the *html* pages and the output figures. It allows me to keep clean repositories: master for the source, and gh-pages only for the website. 

I mostly use RStudio to generate htmls, but when there are a large number of analysis files that need to be updated, I choose to use the simple make command. Below are two of my most recently used paths of update GitHub Pages.

Path 1: I mostly use this one when there's only a small analysis file to be updated.

```
## Work at the gh-pages branch, push website content to gh-pages,
## push source to the master
git checkout gh-pages
cd analysis
make # (or use knitr to render the Rmds)
git add -f *Rmd *html figure/*
git commit -m "add new analysis"
git push origin gh-pages

git checkout master
git merge gh-pages
git add new-analysis.Rmd index.Rmd
git commit -m "add new analysis"
git push origin master
```

Path 2: I use this when the site has not been update in a while, and I need to compile a large number of Rmds.

```
## Work at the master branch, keep all htmls local
## Push source to the master branch, use make to generate htmls
## for the gh-pages branch

git checkout master
cd analysis
git add new-analysis.Rmd index.Rmd
git commit -m "add new analysis"
git push origin master

git checkout gh-pages
git merge master
make
git add *Rmd *html figure/*
git commit -m "add new analysis"
git push origin gh-pages
```



## Resources 

* [John Blischak's tips on worflow management.][contrib]


[site]: http://jhsiao999.github.io/ashlar/analysis
[contrib]: https://github.com/jdblischak/singleCellSeq/blob/master/CONTRIBUTING.md
