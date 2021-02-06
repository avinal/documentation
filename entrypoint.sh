#! /bin/bash -l

# Copyright (c) 2020 Avinal Kumar
#
# Distributed under the terms of GNU GPL 3.0 License
#
# The full license is in the file LICENSE, distributed with this software.

# constants
RED='\033[0;31m' # Red color output for failed commands
GREEN='\033[1;32m' # green color for success
WHITE='\033[1;37m' # white

# Function to check installation of a package
function check_install() {
if [ $(dpkg-query -W -f='${Status}' "$1" 2>/dev/null | grep -c "ok installed") -eq 1 ]
then
    echo -e "${GREEN}$1 OK${WHITE}"
else
    echo -e "${RED}$1 not found !!${WHITE}"
fi
}

apt_packages=("aptitude" "git" "make" "python3" "python3-pip" "tzdata" "openjdk-8-jdk" "doxygen" "perl-doc" "pandoc")

for package in ${apt_packages[@]}
do
    check_install $package
done

