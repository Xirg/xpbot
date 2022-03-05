#!/bin/bash

if ! [ $(id -u) = 0 ]; then
   echo "I am not root!"
   exit 1
fi

mkdir /tmp/src
cd /tmp/src
wget http://search.cpan.org/CPAN/authors/id/I/IW/IWADE/Convert-Bencode_XS-0.06.tar.gz
wget https://rt.cpan.org/Ticket/Attachment/1433449/761974/patch-t_001_tests_t
tar zxf Convert-Bencode_XS-0.06.tar.gz
cd Convert-Bencode_XS-0.06
patch -uNp0 -i ../patch-t_001_tests_t
perl Makefile.PL
make
make test
make install
