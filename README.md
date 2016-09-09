# Task4


This project generates a box for vagrant in one of the following configurations:

* Windows **2008**r2, original MSDN image with no updates

* Windows **2008**r2, MSDN image with actual updates

* Windows **2012**r2, original MSDN image with no updates

* Windows **2012**r2, MSDN image with actual updates


Instructions:

1. Place MSDN ISO image of corresponding OS to ISO directory.

2. Ensure that the filename and MD5 checksum of ISO image are specified properly in `windows_2008_r2.json`
(if you install Windows 2008r2) or `windows_2012_r2.json` (if you install Windows 2012r2). Correct the
filename and checksum if necessary. You can use `md5sum <filename>` to generate a checksum.  

3. If you do not need OS updates, skip to step 5.

4. Depending on OS that you need to use, apply the following changes to enable OS updates:

  * To install Windows 2008r2, **To Do**

  * To install Windows 2012r2, uncomment "WITH WINDOWS UPDATES" section in `answer_files/2012/AutoUnattend.xml`.

5. Run `packer build windows_2008_r2.json` (if you install Windows 2008r2) or `packer build windows_2012_r2.json` (if you install Windows 2012r2).

The build without updates takes 15-30 min on average workstation. With updates, prepare to wait for 3-5 hours.

Once the build completes, you will a file with .box extension in the current directory, this is vagrant box
for the OS of your choice.
  