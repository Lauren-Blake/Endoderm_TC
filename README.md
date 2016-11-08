# About the Endoderm Time Course Project

This experiment collects RNA-seq data from human and chimpanzee iPSCs that are then differntiated into definitive endoderm. 

It was performed by Bryan Pavlovic, Sammy Thomas, and Lauren Blake in the Yoav Gilad lab at the University of Chicago.


# About the website (ashlar)

Workflow template for statistical computing projects at [Stephens Lab](http://stephenslab.uchicago.edu/). 

### Editing basic information and site layout

Now that you have a copy of ashlar. Edit the following content and add your project information.

* analysis/index.Rmd: Homepage of the website, which is typically the table of content. Follow markdown syntax to make bullet lists.
* README.md: readme of the GitHub repository. 
* analysis/include/before_body.html: Edit the name of the repository in line 10. 
Edit the hyperlink of the reposotyr in line 17.
* analysis/license.Rmd: Change the software license if necessary.
* analysis/about.Rmd: Edit basic information about yourself or about the project.
 
### Adding new analysis

The idea is to work from the master branch and then add to both master branch and gh-pages branch.
Using this workflow, gh-pages branch mirrors master branch. Advanced users can modify *.gitignore* 
and choose to not to publish selected files.

```
git checkout master
cd analysis
git add *Rmd *html figure/* (or git add --all)
git commit -m "add new analysis"
git push origin master

git checkout gh-pages
git merge master
git push origin gh-pages
```










