# devenv
The 'install.sh' script is used for installing some software for Ubuntu. 

# so what's downloaded?
- Code::Blocks IDE
- Weptech Fork of Contiki OS 
- RIOT-OS
- Start and compile Cooja Network Simulator (if using InstantContiki3.0)
- Automatic build of example programs for Weptech Saker
- Desktop launcher for uploading programs to Weptech Saker

This has been developed and tested with Ubuntu 14.04 ([InstantContiki3.0](https://sourceforge.net/projects/contiki/files/Instant%20Contiki/)) Virtual Machine using [VMware Workstation 12 Player](https://my.vmware.com/en/web/vmware/free#desktop_end_user_computing/vmware_workstation_player/12_0)
.

# instructions 
```
cd /home/$USER/
git clone git://github.com/vekotinkero/devenv/ 
chmod +x -R devenv
cd devenv
./install.sh
```



