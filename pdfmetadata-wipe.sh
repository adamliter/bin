#!/bin/bash
#
# This script wipes the metadata
# of every pdf file in the current directory
# for the purposes of blind review.
# It uses the command line tool `pdfjam`
# which is part of the TeX Live distribution
# for (La)TeX. It is also available at
# http://freecode.com/projects/pdfjam
# BUT you will need to have a TeX distribution
# installed to use this script as `pdfjam`
# is really just an interface to some
# of the functionality of `pdflatex` and
# the `pdfpages` package by Andreas Matthias

# This part takes every .pdf file in the directory
# and wipes the metadata using `pdfjam`
# But `pdfjam` is kind of annoying because it
# necessarily produces an output file with a
# different file name
# The default output is "i-pdfjam.pdf"
# where "i" is the original file name
# sans file extension
# So, after doing this, we also delete all
# of the original .pdf files
for i in *.pdf ; do
	pdfjam --no-keepinfo "$i" && rm "$i" ;
done

# Then, we can rename all of the new files
# and get rid of the annoying suffix
for i in *.pdf ; do
	mv "$i" "${i//-pdfjam/}" ;
done