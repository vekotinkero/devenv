# devenv
The 'install.sh' script is used for installing some software for Ubuntu. It will log the current user out. Relogin is needed.

# so what does it do?
- Installs Code::Blocks IDE
- Downloads Weptech Fork of Contiki OS 
- Downloads RIOT-OS
- Starts and compiles Cooja Network Simulator (if using InstantContiki3.0)
- Builds example programs for Weptech Saker
- Generates a desktop launcher for uploading programs to Weptech Saker

This has been developed and tested with Ubuntu 14.04 LTS ([InstantContiki3.0](https://sourceforge.net/projects/contiki/files/Instant%20Contiki/)) Virtual Machine using [VMware Workstation 12 Player](https://my.vmware.com/en/web/vmware/free#desktop_end_user_computing/vmware_workstation_player/12_0)
.

# instructions 
```
cd /home/$USER/
git clone git://github.com/vekotinkero/devenv/ 
chmod +x -R devenv
cd devenv
./install.sh
```



