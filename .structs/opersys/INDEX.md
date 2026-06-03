# Operating-System Operator-Language Standards Index

<a id="toc"></a>
## Table of Contents

- [Purpose](#purpose)
- [Catalog](#catalog)
- [Operator-Language Rule](#operator-language-rule)

<a id="purpose"></a>
## Purpose

`opersys` defines OS-specific command surfaces, acronyms, package/service managers, and workflow language so agents do not apply the wrong operating assumptions to a target host.

<a id="catalog"></a>
## Catalog

| File                                            | Purpose                                        |
| ----------------------------------------------- | ---------------------------------------------- |
| `.structs/opersys/gentoo-llvm-openrc/AGENTS.md` | Gentoo LLVM/Clang + OpenRC Agent Standard      |
| `.structs/opersys/devuan/AGENTS.md`             | Devuan Agent Standard                          |
| `.structs/opersys/debian/AGENTS.md`             | Debian >=12 Agent Standard                     |
| `.structs/opersys/rhel/AGENTS.md`               | Red Hat Enterprise Linux 9 + 10 Agent Standard |
| `.structs/opersys/oracle-linux/AGENTS.md`       | Oracle Enterprise Linux 9 + 10 Agent Standard  |
| `.structs/opersys/rocky-linux/AGENTS.md`        | Rocky Linux 9 + 10 Agent Standard              |
| `.structs/opersys/solaris-amd64/AGENTS.md`      | Solaris 10 + 11 AMD64 Agent Standard           |
| `.structs/opersys/solaris-sparc/AGENTS.md`      | Solaris 10 + 11 SPARC Agent Standard           |
| `.structs/opersys/openindiana-amd64/AGENTS.md`  | OpenIndiana AMD64 Agent Standard               |
| `.structs/opersys/freebsd/AGENTS.md`            | FreeBSD 14.x, 15.x, 16.x Agent Standard        |

<a id="operator-language-rule"></a>
## Operator-Language Rule

Agents must use the target OS vocabulary in commands and docs: OpenRC hosts use `rc-service`/`rc-update`; Debian/RHEL-family systemd hosts use `systemctl` only after detection; Solaris/OpenIndiana use SMF/ZFS/IPS language; FreeBSD uses rc/pkg/sysrc/jail/ZFS language.
