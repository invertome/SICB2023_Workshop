These scripts use conda to install the required software in a "sicb2023" environment

The scripts contained herein are meant to assist in the installation of the required software dependencies for the SICB2023 Omics Workshop. There are three versions available, one for Linux systems, and two for MacOS (installation differs slightly for newer M1/M2 chips). Please download the appropriate script, give it permissions to execute, and execute it indicating the full path to the folder where you would like the workshop materials to be downloaded to.

For example:

```
# Assigning permissions to execute
chmod +x install_linux.sh

# Execute installation script from the folder where it was downloaded to. Include the full path where to clone workshop materials into. In this example we are creating a "workshop" folder on the linux desktop for "User1". Make sure this corresponds to your own system.

mkdir /home/User1/Desktop/workshop/

bash install_linux.sh /home/User1/Desktop/workshop/

# Once installation/downloads complete, please load the new conda environment, and run the install checks to make sure the dependencies are working. Remember to update the paths to the ones you previously set.

conda activate sicb2023
cd /home/User1/Desktop/workshop/
chmod +x ./SICB2023_Workshop/installation/checks.sh
bash ./SICB2023_Workshop/installation/checks.sh 
```
