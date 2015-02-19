#!/bin/bash

# the script assumes you are in the root folder of the project
cd "$(readlink -f "$(dirname "$0")/.")"

# processor count.
if [[ -z $PROCESSORCOUNT ]]; then
	PROCESSORCOUNT=`cat /proc/cpuinfo | grep -i ^processor | wc -l`
fi

echo "Running Meta-Object Compiler (MOC)"
mkdir -p ./././././././src/qt/moc

for filename in $(find ./src/qt -type f -name "*.h" | sed -E 's/^(.*)\/([^\/]+)\.h/\2/')
	do 
		moc_cmd="moc-qt4 ./src/qt/$filename.h -o ./src/qt/moc/$filename.cpp"; 
		$moc_cmd; 
		echo $moc_cmd; 
		done;
unset filename

# compile debug version if no arguments are passed to the script
if [[ $# -eq 0 ]]; then
	CONFIG=debug
else
	CONFIG=$1
fi

# create make file and execute it
premake_cmd="./premake/premake4 gmake"
   make_cmd="make config=$CONFIG -R -j${PROCESSORCOUNT} $3"

exitcode=$?
if [[ $exitcode -eq 0 ]]; then
	echo "Create Makefile: $premake_cmd"
	$premake_cmd
	exitcode=$?
fi

if [[ $exitcode -eq 0 ]]; then
	echo "Create Target:   $make_cmd"
	$make_cmd
	exitcode=$?
fi

exit $exitcode
