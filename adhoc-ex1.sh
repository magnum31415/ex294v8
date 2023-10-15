#!/usr/bin/bash
ansible dev -m yum_repository -a "name=mariadb description='Repository MariaDB-Server' baseurl=http://yum.mariadb.org/10.5/centos8-amd64 gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB gpgcheck=True enabled=yes" -b
