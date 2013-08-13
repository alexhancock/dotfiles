#!/bin/bash
# Simple script to link an npm package to usr/local/bin

file=/usr/local/bin/$1;
module=~/node_modules/$1/bin/$1;

if [ -f $file ] ; then
	rm -rf $file
fi

ln -s $module $file