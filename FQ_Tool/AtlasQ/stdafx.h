// stdafx.h : include file for standard system include files,
// or project specific include files that are used frequently, but
// are changed infrequently
//

#pragma once

#define WIN32_LEAN_AND_MEAN		// Exclude rarely-used stuff from Windows headers
#include <stdio.h>
#include <string.h>
#ifdef _WIN32
#include <tchar.h>
#else
#include <stdint.h>
#include <string.h>
#define _TCHAR char
#define _tmain main
#define __int64 long long
#define _snprintf snprintf
#define _vsnprintf vsnprintf
#include <dlfcn.h>
typedef void* HMODULE;
#define LoadLibrary(p) dlopen((p), RTLD_NOW)
#define LoadLibraryA(p) dlopen((p), RTLD_NOW)
#define GetProcAddress(h,n) dlsym((h),(n))
#define FreeLibrary(h) dlclose(h)
#endif
const char* NoCR(const char* path);
extern const char* g_ScriptName;
extern int g_Problems;

// TODO: reference additional headers your program requires here
#include <string>
#include <map>
#include <cstdio>
#include <cstdlib>
#include <vector>
#include <sstream>
#include <map>
#include <utility>
#include <fstream>
#include <list>
#include <ctime>
#include <cstdarg>
#include <iterator>