#!/bin/bash
#
# Clean the project
#

cd "$(readlink -f "$(dirname "$0")/.")"

rm -vrf build/QtExample

rm -vrf obj/*
rm -vrf src/qt/moc/*

rm -vf Makefile
rm -vf QtExample.make
