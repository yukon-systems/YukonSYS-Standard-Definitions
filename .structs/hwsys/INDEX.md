# Hardware, Networking, and Infrastructure Systems Index

<a id="toc"></a>
## Table of Contents

- [Purpose](#purpose)
- [Catalog](#catalog)
- [Critical-Control-Plane Rule](#critical-control-plane-rule)

<a id="purpose"></a>
## Purpose

`hwsys` contains standards for compute hardware, carrier boards, networking appliances/protocols, BMCs, out-of-band management, boot firmware, UEFI/U-Boot, NVIDIA Jetson platforms, and serial access.

<a id="catalog"></a>
## Catalog

| File                                                       | Purpose                                                   |
| ---------------------------------------------------------- | --------------------------------------------------------- |
| `.structs/hwsys/compute/ampere-altra-one.md`               | Ampere Altra and Ampere ONE Agent Standard                |
| `.structs/hwsys/compute/raspberry-pi-cm4.md`               | Raspberry Pi CM4 Hardware Agent Standard                  |
| `.structs/hwsys/compute/raspberry-pi-cm5.md`               | Raspberry Pi CM5 Hardware Agent Standard                  |
| `.structs/hwsys/turingpi/mitx-board-bmc.md`                | Turing Pi mITX Board + BMC Agent Standard                 |
| `.structs/hwsys/turingpi/mitx-cm4.md`                      | Turing Pi mITX Board with Raspberry Pi CM4 Agent Standard |
| `.structs/hwsys/turingpi/mitx-jetson-xavier-nx.md`         | Turing Pi mITX Board with Jetson Xavier NX Agent Standard |
| `.structs/hwsys/turingpi/mitx-jetson-orin-nx.md`           | Turing Pi mITX Board with Jetson Orin NX Agent Standard   |
| `.structs/hwsys/networking/mikrotik-routeros.md`           | MikroTik RouterOS Agent Standard                          |
| `.structs/hwsys/networking/mikrotik-swos.md`               | MikroTik SwOS Agent Standard                              |
| `.structs/hwsys/networking/opnsense.md`                    | OPNsense Agent Standard                                   |
| `.structs/hwsys/networking/arista-eos.md`                  | Arista EOS Agent Standard                                 |
| `.structs/hwsys/networking/openwrt.md`                     | OpenWrt Agent Standard                                    |
| `.structs/hwsys/networking/vyos.md`                        | VyOS Agent Standard                                       |
| `.structs/hwsys/networking/cisco-ios.md`                   | Cisco IOS Agent Standard                                  |
| `.structs/hwsys/networking/lede-switch-os.md`              | LEDE Switch OS Agent Standard                             |
| `.structs/hwsys/networking/ofed-infiniband.md`             | OFED InfiniBand Protocol Agent Standard                   |
| `.structs/hwsys/networking/roce.md`                        | RoCE v1 and RoCE v2 Agent Standard                        |
| `.structs/hwsys/networking/snmp.md`                        | SNMP v1/v2c/v3 Agent Standard                             |
| `.structs/hwsys/networking/ssh.md`                         | OpenSSH and Dropbear SSH Agent Standard                   |
| `.structs/hwsys/networking/openssl.md`                     | OpenSSL 1.x and 3.x Agent Standard                        |
| `.structs/hwsys/networking/hpc-tcp-udp-tuning.md`          | Advanced TCP/UDP Options for HPC Tuning Standard          |
| `.structs/hwsys/networking/vpn-protocols.md`               | Advanced VPN Protocols Agent Standard                     |
| `.structs/hwsys/infrastructure/intel-amt.md`               | Intel AMT Remote Management Agent Standard                |
| `.structs/hwsys/infrastructure/openbmc.md`                 | OpenBMC Agent Standard                                    |
| `.structs/hwsys/infrastructure/redfish.md`                 | Redfish Agent Standard                                    |
| `.structs/hwsys/infrastructure/supermicro-sum-dcm.md`      | Supermicro SUM / Datacenter Manager Tools Agent Standard  |
| `.structs/hwsys/infrastructure/ipmi-tools.md`              | OpenIPMI / FreeIPMI / ipmitool Agent Standard             |
| `.structs/hwsys/infrastructure/dell-idrac.md`              | Dell iDRAC Agent Standard                                 |
| `.structs/hwsys/infrastructure/hpe-ilo.md`                 | HPE iLO Agent Standard                                    |
| `.structs/hwsys/infrastructure/ibm-lc922-oob-bios.md`      | IBM LC922 Out-of-Band Management and BIOS Agent Standard  |
| `.structs/hwsys/infrastructure/u-boot.md`                  | U-Boot Loader Agent Standard                              |
| `.structs/hwsys/infrastructure/nvidia-jetson-xavier-nx.md` | NVIDIA Jetson Xavier NX Agent Standard                    |
| `.structs/hwsys/infrastructure/nvidia-jetson-orin-nx.md`   | NVIDIA Jetson Orin NX Agent Standard                      |
| `.structs/hwsys/infrastructure/nvidia-jetson-orin-agx.md`  | NVIDIA Jetson Orin AGX Agent Standard                     |
| `.structs/hwsys/infrastructure/nvidia-jetson-thor-agx.md`  | NVIDIA Jetson Thor AGX Agent Standard                     |
| `.structs/hwsys/infrastructure/uefi-efibootmgr.md`         | UEFI and efibootmgr Agent Standard                        |
| `.structs/hwsys/infrastructure/serial-linux.md`            | RS232 / RS485 / TTL Serial via Linux Agent Standard       |
| `.structs/hwsys/infrastructure/serial-freebsd.md`          | RS232 / RS485 / TTL Serial via FreeBSD Agent Standard     |
| `.structs/hwsys/infrastructure/serial-solaris.md`          | RS232 / RS485 / TTL Serial via Solaris Agent Standard     |

<a id="critical-control-plane-rule"></a>
## Critical-Control-Plane Rule

BMCs, bootloaders, serial consoles, SSH, VPN, switch/router configs, firmware, and network fabric settings are critical control planes. Agentic workers may propose read-only discovery and reviewed runbooks by default; write operations require explicit human approval, pre-change backup, rollback path, and post-change validation.
