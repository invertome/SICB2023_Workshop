#!/bin/bash

#check if python is installed
if command -v python3 &> /dev/null; then
    echo "Python 3 is installed. Proceeding to next step..."
else
    #check what version of MacOS is running
    if [[ $(sw_vers -productVersion | cut -d . -f 2) -lt 15 ]]; then
        echo "MacOS version is lower than 10.15. Downloading python3 for MacOS 10.14 or lower..."
        curl -O https://www.python.org/ftp/python/3.7.3/python-3.7.3-macosx10.6.pkg
    else
        echo "MacOS version is 10.15 or higher. Downloading python3 for MacOS 10.15 or higher..."
        curl -O https://www.python.org/ftp/python/3.7.3/python-3.7.3-macosx10.9.pkg
    fi

    #prompt user to enter folder to save python3
    echo "Please enter a folder to save the downloaded python3 package:"
    read folder

    #move the python3 package to the specified folder
    mv python-3.7.3-macosx*.pkg $folder

    #install python3
    sudo installer -pkg $folder/python-3.7.3-macosx*.pkg -target /

    #add python3 to path
    export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.7/bin

    #test if python3 was successfully installed
    if command -v python3 &> /dev/null; then
        echo "Python 3 has been successfully installed!"
    fi
fi

#check if conda is installed
if command -v conda &> /dev/null; then
    echo "Conda is installed. Proceeding to next step..."
else
    #check what version of MacOS is running
    if [[ $(sw_vers -productVersion | cut -d . -f 2) -lt 15 ]]; then
        echo "MacOS version is lower than 10.15. Downloading miniconda3 for MacOS 10.14 or lower..."
        curl -O https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
    else
        echo "MacOS version is 10.15 or higher. Downloading miniconda3 for MacOS 10.15 or higher..."
        curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
    fi

    #prompt user to enter folder to save miniconda3
    echo "Please enter a folder to save the downloaded miniconda3 package:"
    read folder

    #move the miniconda3 package to the specified folder
    mv Miniconda3-latest-MacOSX*.sh $folder

    #install miniconda3
    bash $folder/Miniconda3-latest-MacOSX*.sh -b -p $HOME/miniconda3

    #add miniconda3 to path
    export PATH=$PATH:$HOME/miniconda3/bin

    #test if miniconda3 was successfully installed
    if command -v conda &> /dev/null; then
        echo "Miniconda 3 has been successfully installed!"
    fi
fi

#create conda environment "sicb2023"
conda create --name sicb2023 python=3.7

#configure conda
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict

#test if the following software is installed:
#biopython, orthofinder, transdecoder, iqtree, mafft, clipkit, hmmer, hyphy, paml, perl, treeshrink

if command -v biopython &> /dev/null; then
    echo "Biopython is installed."
else
    conda install -n sicb2023 -c bioconda biopython
    echo "Biopython installed."
fi

if command -v orthofinder &> /dev/null; then
    echo "Orthofinder is installed."
else
    conda install -n sicb2023 -c bioconda orthofinder
    echo "Orthofinder installed."
fi

if command -v transdecoder &> /dev/null; then
    echo "Transdecoder is installed."
else
    conda install -n sicb2023 -c bioconda transdecoder
    echo "Transdecoder installed."
fi

if command -v iqtree &> /dev/null; then
    echo "Iqtree is installed."
else
    conda install -n sicb2023 -c bioconda iqtree
    echo "Iqtree installed."
fi

if command -v mafft &> /dev/null; then
    echo "Mafft is installed."
else
    conda install -n sicb2023 -c bioconda mafft
    echo "Mafft installed."
fi

if command -v clipkit &> /dev/null; then
    echo "Clipkit is installed."
else
    conda install -n sicb2023 -c bioconda clipkit
    echo "Clipkit installed."
fi

if command -v hmmer &> /dev/null; then
    echo "Hmmer is installed."
else
    conda install -n sicb2023 -c bioconda hmmer
    echo "Hmmer installed."
fi

if command -v hyphy &> /dev/null; then
    echo "Hyphy is installed."
else
    conda install -n sicb2023 -c bioconda hyphy
    echo "Hyphy installed."
fi

if command -v paml &> /dev/null; then
    echo "Paml is installed."
else
    conda install -n sicb2023 -c bioconda paml
    echo "Paml installed."
fi

if command -v perl &> /dev/null; then
    echo "Perl is installed."
else
    conda install -n sicb2023 -c bioconda perl
    echo "Perl installed."
fi

if command -v treeshrink &> /dev/null; then
    echo "Treeshrink is installed."
else
    conda install -n sicb2023 -c smirarab treeshrink
    echo "Treeshrink installed."
fi

#clone the tiammat repository
git clone https://github.com/mtassia/TIAMMAt.git

#add the location of python, miniconda3, and tiammat to path
export PATH=$PATH:$folder/python-3.7.3-macosx*.pkg:$HOME/miniconda3:$folder/TIAMMAt

#activate sicb2023 environment
conda activate sicb2023

#test if the programs are now able to run
if command -v biopython &> /dev/null; then
    echo "Biopython is working properly."
fi

if command -v orthofinder &> /dev/null; then
    echo "Orthofinder is working properly."
fi

if command -v transdecoder &> /dev/null; then
    echo "Transdecoder is working properly."
fi

if command -v iqtree &> /dev/null; then
    echo "Iqtree is working properly."
fi

if command -v mafft &> /dev/null; then
    echo "Mafft is working properly."
fi

if command -v clipkit &> /dev/null; then
    echo "Clipkit is working properly."
fi

if command -v hmmer &> /dev/null; then
    echo "Hmmer is working properly."
fi

if command -v hyphy &> /dev/null; then
    echo "Hyphy is working properly."
fi

if command -v paml &> /dev/null; then
    echo "Paml is working properly."
fi

if command -v perl &> /dev/null; then
    echo "Perl is working properly."
fi

if command -v treeshrink &> /dev/null; then
    echo "Treeshrink is working properly."
fi
