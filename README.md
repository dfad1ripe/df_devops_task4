# Task4


This project generates a box for vagrant in one of the following configurations:

* Windows **2008**r2, original MSDN image with no updates

* Windows **2008**r2, MSDN image with actual updates

* Windows **2012**r2, original MSDN image with no updates

* Windows **2012**r2, MSDN image with actual updates


## Instructions: ##

1. Place MSDN ISO image of corresponding OS to ISO directory.

2. Ensure that the filename and MD5 checksum of ISO image are specified properly in `windows_2008_r2*.json`
(if you install Windows 2008r2) or `windows_2012_r2*.json` (if you install Windows 2012r2). Correct the
filename and checksum if necessary. You can use `md5sum <filename>` to generate a checksum.

3. Depending on OS that you need to use, run the following command:

  * To install Windows 2008r2, **To Do**

  * To install Windows 2012r2 without updates, run `packer build windows_2012_r2.json`

  * To install Windows 2012r2 with updates, run `packer build windows_2012_r2_updated.json`


The build without updates takes 15-30 min on average workstation. With updates, prepare to wait for a hour or more.

Once the build completes, you will a file with .box extension in the current directory, this is vagrant box
for the OS of your choice.


## Q & A: ##

**Q:** What is packer?

**A:** A tool that prepares boxes for Chef & Co. 

**Q:** Why you can’t download windows boxes from the Internet?

**A:** Because MS missed to release GPL versions of Windows again...

**Q:** What is used for preparing box by packer?

**A:** ISO image of OS distributive, a set of configuration files and scenarios, and any supported hypervisor.

**Q:** How are you installing guest OS by packer?

**A:** Packer creates VM in one of supported and installed hypervisors, boots VM and uses both native OS
mechanisms for initial setup and configuration, and a communicator (SSH, WinRM) to run tasks on live system.

**Q:** What is difference between Win2008r2 & 2012r2 in terms of boxes creation process?

**A:** WinRM is not available out-of-the-box in 2008.

**Q:** Time for preparing Win2008r2 box with updates?

**Q:** -Time for preparing Win2008r2 box without updates?

**Q:**-Time for preparing Win2012r2 box with updates?

**A:** 45-50 min

**Q:**Time for preparing Win2012r2 box without updates?

**A:** 20-25 min

**Q:** What license model you have to use for that boxes?

**A:** Same as for original OS. 


## External issues that I had to consider ##

https://github.com/mitchellh/packer/issues/2401

## Disclaimer ##

Used some materials from:
http://www.hurryupandwait.io/blog/creating-windows-base-images-for-virtualbox-and-hyper-v-using-packer-boxstarter-and-vagrant

WUA_SearchDownloadInstall.vbs script originally provided by Microsoft:
https://msdn.microsoft.com/en-us/library/aa387102%28VS.85%29.aspx, modified to bypass user
input and to reboot if necessary.
