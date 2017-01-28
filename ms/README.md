# README

## Files of the manuscript

The manuscript is now organized in LaTeX format. There are currently seven files and two folders that includes all the files that are needed to construct the manuscript.

1. **ms_interactions.tex** This file contains the main text of the manuscript. It is the central part of the manuscript.

2. **ms_tables** This file calls the tables of the manuscript. If you need to add table, it first needs to be constructed as a independent .tex file, which will be included in the *tables* folder, following the a line needs to be added to the file, the line should look like this:

\input{tables/new_table.tex}

  * **tables** This folder contains the tables of the manuscript. There should be one file for each table.

3. **ms_fig** This file calls the figures of the manuscript.

  * **Figures** This folder includes images that are used as figures (e.g. .png, .jpeg).

4. **ms_basis.tex** This file includes all the command needed to format the manuscript. If  you do not need to go there don't !

5. **ecology.bst** This file formats the bibliographic references using the ESA guidelines. This file is called in the *ms_basis.tex* file. I used this format simply because I do not like the basic LaTeX citation format.

6. **references.bib** This file includes all the literature cited in the manuscript. All references need to be included in a BibTeX format. *This file is not used in the manuscript.* Actually, although some of the references in there are useful, many papers/books that were cited in the manuscript were not in the file. For this reasons, I constructed a new reference files that will hopefully later include all the reference in **references.bib**.

7. **referencesNew.bib** This is the new reference file. This one is used in the manuscript.

## How to build the manuscript

Run the pdflatex build three times. This will ensure that the new references and citations are included properly in the pdf version of the manuscript.
