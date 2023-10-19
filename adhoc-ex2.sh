#!/usr/bin/bash
ansible dev -m user -b -a "name=ali state=present" -i /home/vagrant/lab-ex1/inventory
ansible dev -m file -b -a "path=/home/ali/.ssh owner=ali state=directory" -i /home/vagrant/lab-ex1/inventory
ansible dev -m copy -b -a "src=/home/vagrant/.ssh/id_rsa.pub dest=/home/ali/.ssh/authorized_keys owner=ali group=ali" -i /home/vagrant/lab-ex1/inventory
ansible dev -m lineinfile -b -a "path=/etc/sudoers state=present line='ali ALL = (ALL) NOPASSWD: ALL' validate='visudo -cf %s'" -i /home/vagrant/lab-ex1/inventory
ansible dev -m authorized_key -b -a "user=ali state=present key={{ lookup('file', '/home/vagrant/.ssh/id_rsa.pub') }}" -i /home/vagrant/lab-ex1/inventory


