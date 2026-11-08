// Atlas main (quiet version: prints only errors, batch mode -bat)

#include "stdafx.h"
#include <ctime>
#include <string>
#include <vector>
#include "AtlasCore.h"
#ifdef _WIN32
#include <windows.h>
#else
#include <unistd.h>
#include <sys/wait.h>
#endif

using namespace std;

const char* g_ScriptName = "";
int g_Problems = 0;

static vector<string> g_TempFiles;

static bool MakeTemp(const string& data, string& name)
{
#ifdef _WIN32
	char dir[MAX_PATH], file[MAX_PATH];
	if(!GetTempPathA(MAX_PATH, dir) || !GetTempFileNameA(dir, "atq", 0, file))
		return false;
	FILE* f = fopen(file, "wb");
	if(!f)
		return false;
	fwrite(data.data(), 1, data.size(), f);
	fclose(f);
	name = file;
	return true;
#else
	char tmpl[] = "/tmp/atlasq_XXXXXX";
	int fd = mkstemp(tmpl);
	if(fd < 0)
		return false;
	write(fd, data.data(), data.size());
	close(fd);
	name = tmpl;
	return true;
#endif
}

const char* NoCR(const char* path)
{
	FILE* in = fopen(path, "rb");
	if(!in)
		return path;
	string data;
	char buf[65536];
	size_t n;
	while((n = fread(buf, 1, sizeof(buf), in)) > 0)
		data.append(buf, n);
	fclose(in);
	if(data.find('\r') == string::npos)
		return path;
	string out;
	out.reserve(data.size());
	for(size_t i = 0; i < data.size(); i++)
		if(!(data[i] == '\r' && i + 1 < data.size() && data[i+1] == '\n'))
			out += data[i];
	string name;
	if(!MakeTemp(out, name))
		return path;
	g_TempFiles.push_back(name);
	return g_TempFiles.back().c_str();
}

static void CleanTemp()
{
	for(size_t i = 0; i < g_TempFiles.size(); i++)
		remove(g_TempFiles[i].c_str());
	g_TempFiles.clear();
}

static int RunOne(const char* Rom, const char* Script)
{
	g_ScriptName = Script;
	if(!Atlas.Insert(Rom, Script))
	{
		if(g_Problems == 0)
			printf("%s: Error: insertion failed\n", Script);
		g_Problems++;
	}
	fflush(stdout);
	CleanTemp();
	return g_Problems ? 1 : 0;
}

static string FixPath(string p)
{
#ifndef _WIN32
	for(size_t i = 0; i < p.size(); i++)
		if(p[i] == '\\')
			p[i] = '/';
#endif
	return p;
}

static vector<string> Quoted(const string& line)
{
	vector<string> v;
	size_t i = 0;
	while(i < line.size())
	{
		while(i < line.size() && (line[i] == ' ' || line[i] == '\t'))
			i++;
		if(i >= line.size())
			break;
		string tok;
		if(line[i] == '"')
		{
			size_t j = line.find('"', i + 1);
			if(j == string::npos)
				j = line.size();
			tok = line.substr(i + 1, j - i - 1);
			i = j + 1;
		}
		else
		{
			size_t j = i;
			while(j < line.size() && line[j] != ' ' && line[j] != '\t')
				j++;
			tok = line.substr(i, j - i);
			i = j;
		}
		v.push_back(tok);
	}
	return v;
}

#ifdef _WIN32
static bool RunChild(const string& rom, const string& script, string& out)
{
	char exe[MAX_PATH];
	GetModuleFileNameA(NULL, exe, MAX_PATH);
	string cmd = string("\"") + exe + "\" \"" + rom + "\" \"" + script + "\"";
	SECURITY_ATTRIBUTES sa;
	sa.nLength = sizeof(sa);
	sa.lpSecurityDescriptor = NULL;
	sa.bInheritHandle = TRUE;
	HANDLE rd, wr;
	if(!CreatePipe(&rd, &wr, &sa, 0))
		return false;
	SetHandleInformation(rd, HANDLE_FLAG_INHERIT, 0);
	STARTUPINFOA si;
	ZeroMemory(&si, sizeof(si));
	si.cb = sizeof(si);
	si.dwFlags = STARTF_USESTDHANDLES;
	si.hStdInput = GetStdHandle(STD_INPUT_HANDLE);
	si.hStdOutput = wr;
	si.hStdError = wr;
	PROCESS_INFORMATION pi;
	vector<char> line(cmd.begin(), cmd.end());
	line.push_back(0);
	if(!CreateProcessA(NULL, &line[0], NULL, NULL, TRUE, 0, NULL, NULL, &si, &pi))
	{
		CloseHandle(rd);
		CloseHandle(wr);
		return false;
	}
	CloseHandle(wr);
	char buf[4096];
	DWORD n;
	while(ReadFile(rd, buf, sizeof(buf), &n, NULL) && n > 0)
		out.append(buf, n);
	CloseHandle(rd);
	WaitForSingleObject(pi.hProcess, INFINITE);
	DWORD code = 1;
	GetExitCodeProcess(pi.hProcess, &code);
	CloseHandle(pi.hProcess);
	CloseHandle(pi.hThread);
	return code == 0;
}
#else
static bool RunChild(const string& rom, const string& script, string& out)
{
	int fds[2];
	if(pipe(fds) != 0)
		return false;
	fflush(stdout);
	pid_t pid = fork();
	if(pid == 0)
	{
		close(fds[0]);
		dup2(fds[1], 1);
		dup2(fds[1], 2);
		close(fds[1]);
		exit(RunOne(rom.c_str(), script.c_str()));
	}
	close(fds[1]);
	char buf[4096];
	ssize_t n;
	while((n = read(fds[0], buf, sizeof(buf))) > 0)
		out.append(buf, n);
	close(fds[0]);
	int st = 0;
	waitpid(pid, &st, 0);
	return WIFEXITED(st) && WEXITSTATUS(st) == 0;
}
#endif

static int RunBatch(const char* BatFile, const char* RestFile)
{
	FILE* f = fopen(BatFile, "rb");
	if(!f)
	{
		printf("Unable to open batch file '%s'\n", BatFile);
		return 1;
	}
	string all;
	char buf[65536];
	size_t n;
	while((n = fread(buf, 1, sizeof(buf), f)) > 0)
		all.append(buf, n);
	fclose(f);

	int jobs = 0, failed = 0;
	string report, rest;
	size_t pos = 0;
	while(pos < all.size())
	{
		size_t e = all.find('\n', pos);
		if(e == string::npos)
			e = all.size();
		string line = all.substr(pos, e - pos);
		pos = e + 1;
		if(!line.empty() && line[line.size()-1] == '\r')
			line.erase(line.size()-1);

		if(line.compare(0, 9, "type nul ") == 0)
		{
			size_t g = line.find('>');
			if(g == string::npos)
				continue;
			vector<string> t = Quoted(line.substr(g + 1));
			if(t.empty())
				continue;
			FILE* z = fopen(FixPath(t[0]).c_str(), "wb");
			if(z)
				fclose(z);
			continue;
		}

		vector<string> t = Quoted(line);
		if(t.empty())
		{
			rest += line + "\r\n";
			continue;
		}
		string exe = t[0];
		for(size_t i = 0; i < exe.size(); i++)
			exe[i] = tolower(exe[i]);
		if(exe.size() < 9 || exe.compare(exe.size() - 9, 9, "atlas.exe") != 0)
		{
			rest += line + "\r\n";
			continue;
		}
		vector<string> a(t.begin() + 1, t.end());
		if(a.size() >= 2 && a[0] == "-d")
			a.erase(a.begin(), a.begin() + 2);
		if(a.size() != 2)
			continue;
		string rom = FixPath(a[0]), script = FixPath(a[1]);
		jobs++;

		string out;
		bool ok = RunChild(rom, script, out);
		if(!ok && out.empty())
			out = script + ": Error: Atlas crashed\n";
		if(!ok || !out.empty())
		{
			failed++;
			report += "[" + script + "]\n" + out;
			if(report[report.size()-1] != '\n')
				report += "\n";
		}
	}

	if(failed)
	{
		printf("Atlas: %d/%d file(s) with errors\n\n%s", failed, jobs, report.c_str());
		return 1;
	}
	if(RestFile)
	{
		FILE* r = fopen(RestFile, "wb");
		if(!r)
		{
			printf("Unable to write '%s'\n", RestFile);
			return 1;
		}
		fwrite(rest.data(), 1, rest.size(), r);
		fclose(r);
	}
	return 0;
}

int _tmain(int argc, _TCHAR* argv[])
{
	Logger.SetLogStatus(false);

	if(argc == 3 && strcmp(argv[1], "-bat") == 0)
		return RunBatch(argv[2], NULL);
	if(argc == 5 && strcmp(argv[1], "-bat") == 0 && strcmp(argv[3], "-rest") == 0)
		return RunBatch(argv[2], argv[4]);

	if(argc != 3 && argc != 5)
	{
		printf("Usage: %s [-d logfile] ROM.ext Script.txt\n", argv[0]);
		printf("       %s -bat file.bat [-rest out.bat]   (run every Atlas line of a batch file,\n", argv[0]);
		printf("       then write the other lines to out.bat)\n");
		return 1;
	}

	int argoff = 0;
	if(strcmp("-d", argv[1]) == 0)
		argoff += 2;

	return RunOne(argv[1+argoff], argv[2+argoff]);
}
