#!/bin/bash
cd "$(dirname "$0")"
clang++ -O2 -std=c++11 -w -include stdafx.h -o ../atlas *.cpp 2>&1 | grep -v '^ld: warning'
zig c++ -target x86_64-windows-gnu -O2 -std=c++11 -w -static -include stdafx.h -o ../AtlasQ.exe *.cpp
rm -f ../AtlasQ.pdb
