#!/bin/bash

# Usage: sicb2023workshop_macosM1.sh [Folder_Path]
#download and install script for macos with M1 chip 

#Check if the bioinformatics programs are already installed 
if [ -x "$(command -v iqtree2)" ]; then
 echo 'iqtree2 is already installed.'
else
 echo 'Downloading and installing iqtree2...'
 #Download the latest version of iqtree2
 wget https://github.com/Cibiv/IQ-TREE/releases/download/v2.1.7/iqtree2-MacOS-M1-2.1.7.dmg
 #Install the downloaded version
 hdiutil attach iqtree2-MacOS-M1-2.1.7.dmg
 sudo installer -pkg /Volumes/iqtree2-MacOS-M1-2.1.7.dmg/iqtree2-MacOS-M1-2.1.7.pkg -target /
 #Add the folder to the user's PATH
 export PATH="$PATH:/usr/local/bin/iqtree2"
fi

if [ -x "$(command -v tiammat)" ]; then
 echo 'tiammat is already installed.'
else
 echo 'Downloading and installing tiammat...'
 #Clone the repository
 git clone https://github.com/mtassia/TIAMMAt
 #Install tiammat
 cd TIAMMAt
 make
 #Add the folder to the user's PATH
 export PATH="$PATH:/TIAMMAt/bin"
fi

if [ -x "$(command -v mafft)" ]; then
 echo 'mafft is already installed.'
else
 echo 'Downloading and installing mafft...'
 #Download the latest version of mafft
 wget https://mafft.cbrc.jp/alignment/software/mafft-7.471-mac.dmg
 #Install the downloaded version
 hdiutil attach mafft-7.471-mac.dmg
 sudo installer -pkg /Volumes/mafft-7.471-mac/mafft-7.471-mac.pkg -target /
 #Add the folder to the user's PATH
 export PATH="$PATH:/usr/local/bin/mafft"
fi

if [ -x "$(command -v treeshrink)" ]; then
 echo 'treeshrink is already installed.'
else
 echo 'Downloading and installing treeshrink...'
 #Clone the repository
 git clone https://github.com/stephenturner/TreeShrink.git
 #Install treeshrink
 cd TreeShrink
 make
 #Add the folder to the user's PATH
 export PATH="$PATH:/TreeShrink/bin"
fi

if [ -x "$(command -v clipkit)" ]; then
 echo 'clipkit is already installed.'
else
 echo 'Downloading and installing clipkit...'
 #Clone the repository
 git clone https://github.com/bioinformaticstools/clipkit.git
 #Install clipkit
 cd clipkit
 make
 #Add the folder to the user's PATH
 export PATH="$PATH:/clipkit/bin"
fi

if [ -x "$(command -v seqtk)" ]; then
 echo 'seqtk is already installed.'
else
 echo 'Downloading and installing seqtk...'
 #Clone the repository
 git clone https://github.com/lh3/seqtk.git
 #Install seqtk
 cd seqtk
 make
 #Add the folder to the user's PATH
 export PATH="$PATH:/seqtk/bin"
fi

if [ -x "$(command -v perl)" ]; then
 echo 'perl is already installed.'
else
 echo 'Downloading and installing perl...'
 #Download the latest version of perl
 wget https://www.cpan.org/src/5.0/perl-5.34.0.dmg
 #Install the downloaded version
 hdiutil attach perl-5.34.0.dmg
 sudo installer -pkg /Volumes/perl-5.34.0/perl-5.34.0.pkg -target /
 #Add the folder to the user's PATH
 export PATH="$PATH:/usr/local/bin/perl"
fi

if [ -x "$(command -v biopython)" ]; then
 echo 'biopython is already installed.'
else
 echo 'Downloading and installing biopython...'
 #Download the latest version of biopython
 wget https://biopython.org/DIST/biopython-1.78.dmg
 #Install the downloaded version
 hdiutil attach biopython-1.78.dmg
 sudo installer -pkg /Volumes/biopython-1.78/biopython-1.78.pkg -target /
 #Add the folder to the user's PATH
 export PATH="$PATH:/usr/local/bin/biopython"
fi

if [ -x "$(command -v hmmer)" ]; then
 echo 'hmmer is already installed.'
else
 echo 'Downloading and installing hmmer...'
 #Download the latest version of hmmer
 wget http://eddylab.org/software/hmmer/hmmer-3.3.dmg
 #Install the downloaded version
 hdiutil attach hmmer-3.3.dmg
 sudo installer -pkg /Volumes/hmmer-3.3/hmmer-3.3.pkg -target /
 #Add the folder to the user's PATH
 export PATH="$PATH:/usr/local/bin/hmmer"
fi

if [ -x "$(command -v hyphy)" ]; then
 echo 'hyphy is already installed.'
else
 echo 'Downloading and installing hyphy...'
 #Clone the repository
 git clone https://github.com/veg/hyphy.git
 #Install hyphy
 cd hyphy
 make
 #Add the folder to the user's PATH
 export PATH="$PATH:/hyphy/bin"
fi

if [ -x "$(command -v orthofinder)" ]; then
 echo 'orthofinder is already installed.'
else
 echo 'Downloading and installing orthofinder...'
 #Clone the repository
 git clone https://github.com/davidemms/OrthoFinder.git
 #Install orthofinder
 cd OrthoFinder
 make
 #Add the folder to the user's PATH
 export PATH="$PATH:/OrthoFinder/bin"
fi

if [ -x "$(command -v paml)" ]; then
 echo 'paml is already installed.'
else
 echo 'Downloading and installing paml...'
 #Download the latest version of paml
 wget http://abacus.gene.ucl.ac.uk/software/paml43.dmg
 #Install the downloaded version
 hdiutil attach paml43.dmg
 sudo installer -pkg /Volumes/paml43/paml43.pkg -target /
 #Add the folder to the user's PATH
 export PATH="$PATH:/usr/local/bin/paml"
fi

if [ -x "$(command -v Transdecoder)" ]; then
 echo 'Transdecoder is already installed.'
else
 echo 'Downloading and installing Transdecoder...'
 #Clone the repository
 git clone https://github.com/TransDecoder/TransDecoder.git
 #Install Transdecoder
 cd TransDecoder
 make
 #Add the folder to the user's PATH
 export PATH="$PATH:/TransDecoder/bin"
fi

if [ -x "$(command -v R)" ]; then
 echo 'R is already installed.'
else
 echo 'Downloading and installing R...'
 #Download the latest version of R
 wget https://cran.r-project.org/bin/macosx/R-3.6.3.dmg
 #Install the downloaded version
 hdiutil attach R-3.6.3.dmg
 sudo installer -pkg /Volumes/R-3.6.3/R-3.6.3.pkg -target /
 #Add the folder to the user's PATH
 export PATH="$PATH:/usr/local/bin/R"
fi
# Add the installation directory to the user's PATH
echo "export PATH=$INSTALL_DIR:\$PATH" >> ~/.bashrc
echo "Installation complete!"