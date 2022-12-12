#!/bin/bash

# This script will check if the programs on the provided list are already installed on the system, and if not,
# it will download the latest version from each of their corresponding sources and install
# requirements to a folder designated by a command-line flag, and then add that folder to the user's PATH
# so the programs can be called from the terminal.

# Usage: ./sicb2023workshop_linux.sh <installation_directory>

# Check if the user provided an installation directory
if [ "$#" -ne 1 ]; then
  echo "Please provide an installation directory as an argument."
  exit 1
fi

# Set the installation directory
INSTALL_DIR=$1

# Create the directory if it doesn't exist
if [ ! -d "$INSTALL_DIR" ]; then
  mkdir -p $INSTALL_DIR
fi

# Check if iqtree2 is already installed, and if not, download and install it
if ! command -v iqtree2 &>/dev/null; then
  echo "Installing iqtree2..."
  curl -L https://github.com/Cibiv/IQ-TREE/releases/download/v2.0.6/iqtree-2.0.6-Linux.tar.gz -o iqtree.tar.gz
  tar -xvzf iqtree.tar.gz -C $INSTALL_DIR
  rm iqtree.tar.gz
  export PATH=$INSTALL_DIR/bin:$PATH
fi

# Check if tiammat is already installed, and if not, clone and install it
if ! command -v tiammat &>/dev/null; then
  echo "Installing tiammat..."
  git clone https://github.com/mtassia/TIAMMAt.git $INSTALL_DIR/tiammat
  cd $INSTALL_DIR/tiammat
  make
  export PATH=$INSTALL_DIR/tiammat:$PATH
fi

# Check if mafft is already installed, and if not, download and install it
if ! command -v mafft &>/dev/null; then
  echo "Installing mafft..."
  curl -L https://mafft.cbrc.jp/alignment/software/mafft-7.427-with-extensions-src.tgz -o mafft.tgz
  tar -xvzf mafft.tgz -C $INSTALL_DIR
  rm mafft.tgz
  cd $INSTALL_DIR/mafft-7.427-with-extensions/core
  make clean
  make
  export PATH=$INSTALL_DIR/mafft-7.427-with-extensions/bin:$PATH
fi

# Check if treeshrink is already installed, and if not, clone and install it
if ! command -v treeshrink &>/dev/null; then
  echo "Installing treeshrink..."
  git clone https://github.com/jhcepas/TreeShrink.git $INSTALL_DIR/treeshrink
  cd $INSTALL_DIR/treeshrink
  make
  export PATH=$INSTALL_DIR/treeshrink:$PATH
fi

# Check if clipkit is already installed, and if not, download and install it
if ! command -v clipkit &>/dev/null; then
  echo "Installing clipkit..."
  curl -L https://github.com/cbkmepiv/clipkit/archive/master.zip -o clipkit.zip
  unzip clipkit.zip -d $INSTALL_DIR
  rm clipkit.zip
  cd $INSTALL_DIR/clipkit-master
  make
  export PATH=$INSTALL_DIR/clipkit-master:$PATH
fi

# Check if seqtk is already installed, and if not, clone and install it
if ! command -v seqtk &>/dev/null; then
  echo "Installing seqtk..."
  git clone https://github.com/lh3/seqtk.git $INSTALL_DIR/seqtk
  cd $INSTALL_DIR/seqtk
  make
  export PATH=$INSTALL_DIR/seqtk:$PATH
fi

# Check if perl is already installed, and if not, download and install it
if ! command -v perl &>/dev/null; then
  echo "Installing perl..."
  curl -L https://www.cpan.org/src/5.0/perl-5.30.3.tar.gz -o perl.tar.gz
  tar -xvzf perl.tar.gz -C $INSTALL_DIR
  rm perl.tar.gz
  cd $INSTALL_DIR/perl-5.30.3
  ./Configure -des -Dprefix=$INSTALL_DIR/perl
  make
  make test
  make install
  export PATH=$INSTALL_DIR/perl/bin:$PATH
fi

# Check if biopython is already installed, and if not, download and install it
if ! command -v python &>/dev/null; then
  echo "Installing biopython..."
  curl -L https://github.com/biopython/biopython/archive/master.zip -o biopython.zip
  unzip biopython.zip -d $INSTALL_DIR
  rm biopython.zip
  cd $INSTALL_DIR/biopython-master
  python setup.py install --prefix=$INSTALL_DIR/biopython
  export PATH=$INSTALL_DIR/biopython/bin:$PATH
fi

# Check if hmmer is already installed, and if not, download and install it
if ! command -v hmmer &>/dev/null; then
  echo "Installing hmmer..."
  curl -L http://eddylab.org/software/hmmer3/3.3/hmmer-3.3.tar.gz -o hmmer.tar.gz
  tar -xvzf hmmer.tar.gz -C $INSTALL_DIR
  rm hmmer.tar.gz
  cd $INSTALL_DIR/hmmer-3.3
  ./configure --prefix=$INSTALL_DIR/hmmer
  make
  make check
  make install
  export PATH=$INSTALL_DIR/hmmer/bin:$PATH
fi

# Check if hyphy is already installed, and if not, clone and install it
if ! command -v hyphy &>/dev/null; then
  echo "Installing hyphy..."
  git clone https://github.com/veg/hyphy.git $INSTALL_DIR/hyphy
  cd $INSTALL_DIR/hyphy
  make
  export PATH=$INSTALL_DIR/hyphy:$PATH
fi

# Check if orthofinder is already installed, and if not, download and install it
if ! command -v orthofinder &>/dev/null; then
  echo "Installing orthofinder..."
  curl -L https://github.com/davidemms/OrthoFinder/archive/2.3.5.zip -o orthofinder.zip
  unzip orthofinder.zip -d $INSTALL_DIR
  rm orthofinder.zip
  cd $INSTALL_DIR/OrthoFinder-2.3.5
  python setup.py install --prefix=$INSTALL_DIR/orthofinder
  export PATH=$INSTALL_DIR/orthofinder/bin:$PATH
fi

# Check if paml is already installed, and if not, download and install it
if ! command -v codeml &>/dev/null; then
  echo "Installing paml..."
  curl -L http://abacus.gene.ucl.ac.uk/software/paml4.9g.tgz -o paml.tgz
  tar -xvzf paml.tgz -C $INSTALL_DIR
  rm paml.tgz
  cd $INSTALL_DIR/paml4.9g
  make -f Makefile.unix
  export PATH=$INSTALL_DIR/paml4.9g:$PATH
fi

# Download and install Transdecoder
if ! command -v TransDecoder.LongOrfs &>/dev/null; then
  curl -L https://github.com/TransDecoder/TransDecoder/archive/5.5.0.tar.gz > TransDecoder-5.5.0.tar.gz
  tar xvfz TransDecoder-5.5.0.tar.gz
  cd TransDecoder-5.5.0
  make
  sudo ln -s TransDecoder.LongOrfs /usr/local/bin/TransDecoder.LongOrfs
  cd ..
  rm TransDecoder-5.5.0.tar.gz
fi

# Download and install R
if ! command -v R &>/dev/null; then
  curl -L https://cran.r-project.org/src/base/R-4/R-4.0.2.tar.gz > R-4.0.2.tar.gz
  tar xvfz R-4.0.2.tar.gz
  cd R-4.0.2
  ./configure --prefix=/usr/local
  make
  sudo make install
  cd ..
  rm R-4.0.2.tar.gz
fi

# Add the installation directory to the user's PATH
echo "export PATH=$INSTALL_DIR:\$PATH" >> ~/.bashrc
echo "Installation complete!"