Report Linux:

Level and layers:
- User processes: GUI, Servers, Shell
- Linux kernel: Systems Calls, Process Management, Memory management, Device Drivers
- Hardware: CPU, RAM, Disks, Network Ports

***Include: 
1. Kernel:
 	+ Process: determining which processes are allowed to use CPU
 	+ Memory: keep track of all memory, which might be shared or free
 	+ Device drivers: as an interface between hardware and processes
 	+ System calls and suppport: use sys call to communicate with kernel

1.1 process management:
	describes the starting, pausing, resuming, and termining of processes.
Context switch: process giving up control of the CPU
Time slice: each piece of time: gives a process enough time for significant computation.

the kernel is resposible for context switching. The time slice is up, what's happens:
	- CPU interrupt the current process, switches into kernel mode.
	- kernel performs any tasks that might have come up during the preceding time slide
	- kernel lets another process run
	- kernel prepares the memory for this new process, then prepares the CPU
	- kernel tells the CPU how long time slice for the new process will last
	- kernel switch the CPU into user mode and hand control of the CPU to the process

2.1 The Bourne shell: /bin/sh
	the shell is one of the most impoertant part in Unix system
	shell script: text files that contain a sequence of shell commands. (with MS-DOS such as .BAT file)

	Linux use bash (Bourne-again) shell

*** Using shell:
 - The sell window: echo, cat
 - basic command: ls, cp, mv, touch, rm, echo
 - navigating directories: cd, mkdir, rmdir
 - wild cards: *
 - intermediate commands: grep, less, pwd, diff, file, head, tail, sort
 - environment and shell variables: $var = value, eport stuff
 - special patht
 - text editor: vi, vim, nano, emacs
 - shell input and output: >, >>, <, <<
 - kill process: kill pid, kill -stop pid, kill -cont pid, kill -9 pid
 - background process: gnuzip
 - file modes and permisstions: 
 	-rw- r-- r--: (u, g, o) (r=4, w=2, x=1)
 - modify permissions: chmod g+r file, chmod 777 file
 - archive: gzip, tar, zcat

2.2 Linux dir
/
	bin/: contains ready-to-run programs, having been created by a 
		C compiler
	dev/: device file
	etc/: core system configuration dir: usrs password, boot, device, networking, setup files
	usr/: contains a large directory hierarchy, including the bulk of the Linux system
	home/: personal dir for regular users
	lib/: contains code that executables can use
	sbin/: The place for system executables
	proc/: Provides system statistics through a browsable directory-and-file interface.
	tmp/:  A storage area for smaller, temporary files that you don’t care much about
	var/: The variable subdirectory, where programs record runtime information. System logging, user tracking, caches, and other files that system programs create and manage are here
	sys/: This directory is similar to /proc in that it provides a device and system interface
	root/: root user

3.1 Linux kernel boots:
	- BIOS or boot firmware
	- boot loader file kernel image on disk
	- kernel inti devices and its drivers
	- kernel mount file sys
	- kernel start a program called init with a process ID of 1 => user space start
	- init sets the rest of the system process in motion
	- init user log in, usualy at the end or near the end of the boot

Boot loader: GRUB, LILO (UEFI), SYSLINUX, LOADLIN (MS-DOS)...
*** Details:
- MBR Boot: master boot record
- UEFI Boot: Unified EFI (Extensible Firmware Interface)
- ESP: EFI system Partition

*** How Grub Works:
- The PC BIOS or firmware initializes the hardware and searches its boot-order storage devices for boot code
- Upon finding the boot code, the BIOS/firmware loads and executes it. This is where GRUB begins
- The GRUB core loads.
- The core initializes. At this point, GRUB can now access disks and filesystems
- GRUB identifies its boot partition and loads a configuration there.
- GRUB gives the user a chance to change the configuration
- After a timeout or user action, GRUB executes the configuration
- In the course of executing the configuration, GRUB may load additional code (modules) in the boot partition
- GRUB executes a boot command to load and execute the kernel as specified by the configuration’s linux command.

4.1 Users space and Kernel space:
- User space: User application, GNU C library
- Kernel space: system call, kernel, Architecture - Dependent Kernel code

Kernel: monolithic (Linux), microkernel, hyrbrid (OS X, Windows)

5.1 System config:




		




