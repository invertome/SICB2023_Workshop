The scripts contained herein are meant to assist in the installation of the required software dependencies for the SICB2023 Omics Workshop. There are three versions available, one for Linux systems, and two for MacOS (installation differs slightly for newer M1/M2 chips). Please download the appropriate script, give it permissions to execute, and execute it indicating the full path to the folder where you would like the workshop materials to be downloaded to.

The script will check if Python3 and Anaconda/Miniconda are installed, if they are not they will be downloaded and installed for the local user. Once conda is working, it will then create a new conda environment (to avoid possible conflicts with previous installations) where the software and associated dependencies will be installed as conda packages. The final step involves cloning from github repositories the scripts and datasets that will be employed during the workshop, and updating ~/.bashrc to reflect the PATH of the newly installed/downloaded software and scripts.

If you are an intermediate/advanced user, feel free to modify the scripts to adjust them to your needs.

An example installation run:

```
# Open your terminal

# Download the installation script to your current folder. Replace "install_linux.sh", for "install_macos.sh" or "install_macosM1.sh"
# according to OS and chip type

wget https://github.com/invertome/SICB2023_Workshop/raw/main/installation/install_linux.sh


# Assigning permissions to execute

chmod +x install_linux.sh


# Execute installation script from the folder where it was downloaded to. Include the full path where to clone workshop 
# materials into. In this example we are creating a "workshop" folder on the linux desktop for "User1". Make sure this corresponds 
# to your own system.

mkdir /home/User1/Desktop/workshop/

bash install_linux.sh /home/User1/Desktop/workshop/


# Once installation/downloads complete, please restart your terminal, load the new conda environment, and run the install checks 
# to make sure the dependencies are working. Remember to update the paths to the ones you previously set.

conda activate sicb2023
cd /home/User1/Desktop/workshop/
chmod +x ./SICB2023_Workshop/installation/checks.sh
bash ./SICB2023_Workshop/installation/checks.sh 


```

If everything installs and the checks are successful, then you are all set. If there are any problems during installation, please make note of the commands & output, and send us an email to troubleshoot the process:  jorgepm AT colostate.edu 
We will be troubleshooting installations onsite before the workshop commences. If you would like assistance on the day of the workshop, please arrive early and allow ample time for any eventualities.
