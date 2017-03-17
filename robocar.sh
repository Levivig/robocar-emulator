#!/bin/sh

# dependencies
apt-get update  # To get the latest package lists
apt-get install git -y
apt-get install autoconf -y 
apt-get install libtool -y
apt-get install protobuf-compiler libprotobuf-dev -y
apt-get install g++ -y
apt-get install libboost-all-dev -y
apt-get install flex -y
apt-get install default-jdk -y
apt-get install maven -y
apt-get install libexpat1-dev -y
apt-get install zlib1g-dev -y
apt-get install libbz2-dev -y
apt-get install libsparsehash-dev -y
apt-get install libgdal1-dev -y
apt-get install libgeos++-dev -y
apt-get install libproj-dev -y
apt-get install doxygen graphviz xmlstarlet -y
apt-get install cmake -y

# libosmium
mkdir libosmium
cd libosmium/
git clone https://github.com/osmcode/libosmium.git
cd libosmium/
cmake .
make
sudo make install
cd .. 
sudo cp libosmium/include/* /usr/local/include

cd

# OSM-binary
mkdir OSM-binary
cd OSM-binary/
git clone https://github.com/scrosby/OSM-binary.git
cd OSM-binary/
make -C src
sudo make -C src install

cd

# protozeo
git clone https://github.com/mapbox/protozero.git
cd protozero
sudo make install
cd

#robocar install
git clone https://github.com/Levivig/robocar-emulator.git
cd robocar-emulator/justine/rcemu
autoreconf --install

./configure 

make

cd ../rcwin
mvn clean compile package site assembly:assembly

cd
sudo chown -R $(whoami) robocar-emulator/

