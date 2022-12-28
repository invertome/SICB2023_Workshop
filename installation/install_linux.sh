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

fi

# create conda environment
conda create -n sicb2023 python=3.7 -y

# add channels
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict

conda init bash
source activate base
conda activate sicb2023

conda install -c conda-forge coreutils -y

# install programs
programs=("biopython" "hyphy" "orthofinder" "transdecoder" "iqtree" "mafft" "clipkit" "hmmer" "paml" "treeshrink" "seqtk")
for program in "${programs[@]}"
do
    if [ "$program" == "treeshrink" ]; then
        conda install -c smirarab treeshrink -n sicb2023 -y
    else
        conda install $program -n sicb2023 -y
    fi
done

conda install -y -n sicb2023 -c bioconda perl-db-file
conda install -y -n sicb2023 -c conda-forge r-ape
conda install -y -n sicb2023 -c bioconda perl-uri
cpan URI::Escape


# clone TIAMMAt
cd $folder
git clone https://github.com/mtassia/TIAMMAt.git

mkdir Proteomes 
mkdir PfamModels 
wget http://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/Pfam-A.hmm.gz
gzip -d *.gz #Decompress pfam database

#Set-up Proteomes directory
cd Proteomes/
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/003/605/GCF_000003605.2_Skow_1.1/GCF_000003605.2_Skow_1.1_protein.faa.gz #Download example proteome 1
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/224/145/GCF_000224145.3_KH/GCF_000224145.3_KH_protein.faa.gz #Download example proteome 2
gzip -d * #Decompress downloaded proteoms

#Set-up PfamModels directory
cd ..
cd PfamModels/

wget http://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/Pfam-A.hmm.dat.gz #Low-weight metadata used to get up-to-date accession for target domains
wget http://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/Pfam-A.seed.gz #STOCKHOLM formatted sed alignments
gzip -d *.gz #

cd $folder

# clone Workshop materials
git clone https://github.com/invertome/SICB2023_Workshop.git

# add location of python, miniconda3, and tiammat to path
export PATH="/usr/local/bin:$HOME/miniconda3/bin:$folder/TIAMMAt:$PATH:$folder/SICB2023_Workshop/scripts:$PATH"


prog_cmds=("hyphy" "orthofinder" "TransDecoder.LongOrfs" "iqtree" "mafft" "clipkit" "hmmsearch" "codeml" "run_treeshrink.py" "seqtk")

# test if programs are working
for program in "${prog_cmds[@]}"
do
    if command -v $program &>/dev/null; then
        echo "$program is working properly"
    else
        echo "$program is not working properly, may need to restart terminal?"
    fi
done

echo "To verify whether the conda packages were installed succesfully or not, once this program exits please restart your terminal, cd into the 'SICB2023_Workshop/' folder and run: 'conda activate sicb2023 && chmod +x ./installation/checks.sh && bash ./installation/checks.sh' "
