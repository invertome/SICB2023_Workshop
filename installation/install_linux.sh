#!/bin/bash

#Usage:  ./install_linux.sh /full/path/to/install/folder/

# check if python is installed
if command -v python &>/dev/null; then
    echo "Python is already installed"
else
    # download python to specified folder
    folder=$1
    mkdir $folder
    cd $folder
    wget https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tgz
    tar -xvzf Python-3.7.3.tgz
    cd Python-3.7.3
    # install python as local user
    ./configure --prefix=/usr/local
    make && make install
    # add python to path
    export PATH="/usr/local/bin:$PATH"
fi

# check if conda is installed
if command -v conda &>/dev/null; then
    echo "Conda is already installed"
else
    # download miniconda3 to specified folder
    cd $folder
    if [ "$(uname)" == "Darwin" ]; then
        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
        # install miniconda3
        bash Miniconda3-latest-MacOSX-x86_64.sh
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
        # install miniconda3
        bash Miniconda3-latest-Linux-x86_64.sh
    fi
    # create conda environment
    conda create -n sicb2023 python=3.7
    # add channels
    conda config --add channels defaults
    conda config --add channels bioconda
    conda config --add channels conda-forge
    conda config --set channel_priority strict
fi

# install programs
programs=("biopython" "orthofinder" "transdecoder" "iqtree" "mafft" "clipkit" "hmmer" "hyphy" "paml" "perl" "run_treeshrink.py")
for program in "${programs[@]}"
do
    if command -v $program &>/dev/null; then
        echo "$program is already installed"
    else
        if [ "$program" == "run_treeshrink.py" ]; then
            conda install -c smirarab treeshrink -n sicb2023
        else
            conda install $program -n sicb2023
        fi
    fi
done

# clone TIAMMAt
cd $folder
git clone https://github.com/mtassia/TIAMMAt.git

# clone Workshop materials
https://github.com/invertome/SICB2023_Workshop.git

# add location of python, miniconda3, and tiammat to path
export PATH="/usr/local/bin:$HOME/miniconda3/bin:$folder/TIAMMAt:$PATH:$folder/SICB2023_Workshop/scripts:$PATH"
source $HOME/miniconda3/bin/activate sicb2023

# test if programs are working
for program in "${programs[@]}"
do
    if command -v $program &>/dev/null; then
        echo "$program is working properly"
    else
        echo "$program is not working properly"
    fi
done
