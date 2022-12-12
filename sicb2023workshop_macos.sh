#!/bin/bash

# Usage: sicb2023workshop_macos.sh [Folder_Path]

# Set folder path
FOLDER_PATH=$1

# Create folder if it does not exist
if [ ! -d "$FOLDER_PATH" ]; then
  mkdir -p $FOLDER_PATH
fi

# Download and install iqtree2
if [ ! -e "/usr/local/bin/iqtree" ]; then
  curl -L https://github.com/Cibiv/IQ-TREE/releases/download/v2.0.6/iqtree-2.0.6-MacOSX.dmg > iqtree-2.0.6-MacOSX.dmg
  hdiutil attach iqtree-2.0.6-MacOSX.dmg 
  sudo installer -package /Volumes/IQ-TREE\ 2.0.6/IQ-TREE\ 2.0.6.pkg -target /
  hdiutil detach /Volumes/IQ-TREE\ 2.0.6
  rm iqtree-2.0.6-MacOSX.dmg
fi

# Download and install tiammatt
if [ ! -e "$FOLDER_PATH/tiammatt" ]; then
  cd $FOLDER_PATH
  git clone https://github.com/mtassia/TIAMMAt
  cd TIAMMAt
  make
fi

# Download and install mafft
if [ ! -e "/usr/local/bin/mafft" ]; then
  curl -L https://mafft.cbrc.jp/alignment/software/mafft-7.427-with-extensions-src.tgz > mafft-7.427-with-extensions-src.tgz
  tar xvfz mafft-7.427-with-extensions-src.tgz
  cd mafft-7.427-with-extensions/core
  ./configure --prefix=/usr/local
  make
  sudo make install
  cd ../..
  rm mafft-7.427-with-extensions-src.tgz
fi

# Download and install treeshrink
if [ ! -e "/usr/local/bin/treeshrink" ]; then
  curl -L https://github.com/JosephTassarotti/TreeShrink/releases/download/v0.2.2/treeshrink-0.2.2-MacOSX.dmg > treeshrink-0.2.2-MacOSX.dmg
  hdiutil attach treeshrink-0.2.2-MacOSX.dmg 
  sudo installer -package /Volumes/TreeShrink\ 0.2.2/TreeShrink\ 0.2.2.pkg -target /
  hdiutil detach /Volumes/TreeShrink\ 0.2.2
  rm treeshrink-0.2.2-MacOSX.dmg
fi

# Download and install clipkit
if [ ! -e "/usr/local/bin/clipkit" ]; then
  curl -L https://github.com/davidemms/ClipKit/releases/download/v0.2.1/clipkit-0.2.1-MacOSX.dmg > clipkit-0.2.1-MacOSX.dmg
  hdiutil attach clipkit-0.2.1-MacOSX.dmg 
  sudo installer -package /Volumes/ClipKit\ 0.2.1/ClipKit\ 0.2.1.pkg -target /
  hdiutil detach /Volumes/ClipKit\ 0.2.1
  rm clipkit-0.2.1-MacOSX.dmg
fi

# Download and install seqtk
if [ ! -e "/usr/local/bin/seqtk" ]; then
  curl -L https://github.com/lh3/seqtk/archive/v1.3.tar.gz > v1.3.tar.gz
  tar xvfz v1.3.tar.gz
  cd seqtk-1.3
  make
  sudo ln -s seqtk /usr/local/bin/seqtk
  cd ..
  rm v1.3.tar.gz
fi

# Download and install Perl
if [ ! -e "/usr/bin/perl" ]; then
  curl -L https://cpan.metacpan.org/authors/id/J/JM/JMCNAMARA/perl-5.30.1.tar.gz > perl-5.30.1.tar.gz
  tar xvfz perl-5.30.1.tar.gz
  cd perl-5.30.1
  ./Configure -des -Dprefix=/usr/local
  make
  sudo make install
  cd ..
  rm perl-5.30.1.tar.gz
fi

# Download and install Biopython
if [ ! -e "/usr/local/bin/biopython" ]; then
  curl -L https://github.com/biopython/biopython/archive/biopython-1.76.tar.gz > biopython-1.76.tar.gz
  tar xvfz biopython-1.76.tar.gz
  cd biopython-biopython-1.76
  python3 setup.py build
  python3 setup.py install
  cd ..
  rm biopython-1.76.tar.gz
fi

# Download and install hmmer
if [ ! -e "/usr/local/bin/hmmsearch" ]; then
  curl -L https://github.com/EddyRivasLab/hmmer/archive/3.3.tar.gz > hmmer-3.3.tar.gz
  tar xvfz hmmer-3.3.tar.gz
  cd hmmer-3.3
  ./configure --prefix=/usr/local
  make
  sudo make install
  cd ..
  rm hmmer-3.3.tar.gz
fi

# Download and install HyPhy
if [ ! -e "/usr/local/bin/hyphy" ]; then
  curl -L https://github.com/veg/hyphy/archive/2.3.13.tar.gz > hyphy-2.3.13.tar.gz
  tar xvfz hyphy-2.3.13.tar.gz
  cd hyphy-2.3.13
  ./configure --prefix=/usr/local
  make
  sudo make install
  cd ..
  rm hyphy-2.3.13.tar.gz
fi

# Download and install OrthoFinder
if [ ! -e "/usr/local/bin/OrthoFinder" ]; then
  curl -L https://github.com/davidemms/OrthoFinder/releases/download/2.4.1/OrthoFinder-2.4.1-MacOSX.dmg > OrthoFinder-2.4.1-MacOSX.dmg
  hdiutil attach OrthoFinder-2.4.1-MacOSX.dmg
  sudo installer -package /Volumes/OrthoFinder\ 2.4.1/OrthoFinder\ 2.4.1.pkg -target /
  hdiutil detach /Volumes/OrthoFinder\ 2.4.1
  rm OrthoFinder-2.4.1-MacOSX.dmg
fi

# Download and install PAML
if [ ! -e "/usr/local/bin/codeml" ]; then
  curl -L https://github.com/davidemms/PAML/releases/download/4.9/paml-4.9-MacOSX.dmg > paml-4.9-MacOSX.dmg
  hdiutil attach paml-4.9-MacOSX.dmg
  sudo installer -package /Volumes/PAML\ 4.9/PAML\ 4.9.pkg -target /
  hdiutil detach /Volumes/PAML\ 4.9
  rm paml-4.9-MacOSX.dmg
fi

# Download and install Transdecoder
if [ ! -e "/usr/local/bin/TransDecoder.LongOrfs" ]; then
  curl -L https://github.com/TransDecoder/TransDecoder/archive/5.5.0.tar.gz > TransDecoder-5.5.0.tar.gz
  tar xvfz TransDecoder-5.5.0.tar.gz
  cd TransDecoder-5.5.0
  make
  sudo ln -s TransDecoder.LongOrfs /usr/local/bin/TransDecoder.LongOrfs
  cd ..
  rm TransDecoder-5.5.0.tar.gz
fi

# Download and install R
if [ ! -e "/usr/bin/R" ]; then
  curl -L https://cran.r-project.org/src/base/R-4/R-4.0.2.tar.gz > R-4.0.2.tar.gz
  tar xvfz R-4.0.2.tar.gz
  cd R-4.0.2
  ./configure --prefix=/usr/local
  make
  sudo make install
  cd ..
  rm R-4.0.2.tar.gz
fi

# Add folder to user's PATH
echo "export PATH=$PATH:$FOLDER_PATH" >> ~/.bash_profile
source ~/.bash_profile