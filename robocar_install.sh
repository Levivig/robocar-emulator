#!/bin/sh

#robocar install
git clone https://github.com/Levivig/robocar-emulator.git
cd robocar-emulator/justine/rcemu
autoreconf --install

./configure 

make

cd ../rcwin
mvn clean compile package site assembly:assembly
