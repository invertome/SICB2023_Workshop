#!/bin/bash

#Usage:  ./install_macosM1.sh /full/path/to/installation/folder/

folder=$1

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


    #move the python3 package to the specified folder
    mv python-3.7.3-macosx*.pkg $folder

    #install python3
    sudo installer -pkg $folder/python-3.7.3-macosx*.pkg -target /

    #add python3 to path
    export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.7/bin
    #add python3 to bashrc
    echo "export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.7/bin" >> ~/.bashrc
    
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


    #move the miniconda3 package to the specified folder
    mv Miniconda3-latest-MacOSX*.sh $folder

    #install miniconda3
    bash $folder/Miniconda3-latest-MacOSX*.sh -b -p $HOME/miniconda3

    #add miniconda3 to path
    export PATH=$PATH:$HOME/miniconda3/bin
    
    #add miniconda3 to bashrc
    echo "export PATH=$PATH:$HOME/miniconda3/bin" >> ~/.bashrc

    #test if miniconda3 was successfully installed
    if command -v conda &> /dev/null; then
        echo "Miniconda 3 has been successfully installed!"
    fi
fi


#create conda environment "sicb2023"
CONDA_SUBDIR=osx-64 conda create -n sicb2023 -y python=3.7
source activate base
conda activate sicb2023

#configure conda
conda config --env --set subdir osx-64
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict

#test if the following software is installed:
#orthofinder, transdecoder, iqtree, mafft, clipkit, hmmer, hyphy, paml, perl, treeshrink, seqtk

conda install -c conda-forge coreutils -y

if command -v orthofinder &> /dev/null; then
    echo "Orthofinder is installed."
else
    conda install -n sicb2023 orthofinder -y
    echo "Orthofinder installed."
fi

if command -v TransDecoder.LongOrfs &> /dev/null; then
    echo "Transdecoder is installed."
else
    conda install -n sicb2023 transdecoder -y
    echo "Transdecoder installed."
fi

if command -v iqtree &> /dev/null; then
    echo "Iqtree is installed."
else
    conda install -n sicb2023 iqtree -y
    echo "Iqtree installed."
fi

if command -v mafft &> /dev/null; then
    echo "Mafft is installed."
else
    conda install -n sicb2023 mafft -y
    echo "Mafft installed."
fi

if command -v clipkit &> /dev/null; then
    echo "Clipkit is installed."
else
    conda install -n sicb2023 clipkit -y
    echo "Clipkit installed."
fi

if command -v hmmsearch &> /dev/null; then
    echo "Hmmer is installed."
else
    conda install -n sicb2023 hmmer -y
    echo "Hmmer installed."
fi

if command -v hyphy &> /dev/null; then
    echo "Hyphy is installed."
else
    conda install -n sicb2023 hyphy -y
    echo "Hyphy installed."
fi

if command -v codeml &> /dev/null; then
    echo "Paml is installed."
else
    conda install -n sicb2023 paml -y
    echo "Paml installed."
fi

if command -v run_treeshrink.py &> /dev/null; then
    echo "Treeshrink is installed."
else
    conda install -n sicb2023 -c smirarab treeshrink -y
    echo "Treeshrink installed."
fi

if command -v seqtk &> /dev/null; then
    echo "seqtk is installed."
else
    conda install -n sicb2023 seqtk -y
    echo "seqtk installed."
fi

conda install -n sicb2023 python=3.7 -y

#activate sicb2023 environment
source activate base
conda activate sicb2023

cd $folder

#clone the tiammat repository
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

#clone the workshop materials
git clone https://github.com/invertome/SICB2023_Workshop.git

#add the location of python, miniconda3, and tiammat to path
export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.7/bin:$HOME/miniconda3/bin:$folder/TIAMMAt:$folder/SICB2023_Workshop/scripts

#add miniconda3 to bashrc
echo "export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.7/bin:$HOME/miniconda3/bin:$folder/TIAMMAt:$folder/SICB2023_Workshop/scripts" >> ~/.bashrc

#test if the programs are now able to run

if command -v orthofinder &> /dev/null; then
    echo "Orthofinder is working properly."
fi

if command -v TransDecoder.LongOrfs &> /dev/null; then
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

if command -v hmmsearch &> /dev/null; then
    echo "Hmmer is working properly."
fi

if command -v hyphy &> /dev/null; then
    echo "Hyphy is working properly."
fi

if command -v codeml &> /dev/null; then
    echo "Paml is working properly."
fi

if command -v perl &> /dev/null; then
    echo "Perl is working properly."
fi

if command -v run_treeshrink.py &> /dev/null; then
    echo "Treeshrink is working properly."
fi

if command -v seqtk &> /dev/null; then
    echo "seqtk is working properly."
fi


echo "To verify whether the conda packages were installed succesfully or not, once this program exits please restart your terminal, cd into the 'SICB2023_Workshop/' folder and run: 'conda activate sicb2023 && chmod +x ./installation/checks.sh && bash ./installation/checks.sh' "
