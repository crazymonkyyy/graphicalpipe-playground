/*
dsl for piping generating 'pipexec' commands
```
foo | bar |
cat
---
c:42>f:69
```

will have foo piping into bar into foo
while cat fd 42 will pipe into foo fd 69

pass in "alias" to see debug infomation and how commands are being aliased

Im in hell please never make me touch this code again, do not edit only delete and restart

*/

import std;
void main(string[] file){
	string[] commands;
	int[string] dupcatch;
	int[string] aliases;
	string[] names;
	struct edge{
		int src;
		int srci;
		int dst;
		int dsti;
	}
	edge[] edges;
	bool print=false;
	//---
	string tostring(int i){
		if(i==0){return "";}
		return i.to!string;
	}
	void addcommand(string s){
		import std.ascii;
		auto i=s.countUntil!isAlpha;
		string t=s[i..$].splitter(' ').front.filter!isAlpha.array.to!string;
		if(print){t.writeln(" added");}
		names~=t;
		commands~=s;
	}
	void addedge(string s){
		
	}
	void addnaturaledge(int i){
		edges~=edge(i,1,i+1,0);
	}
	void addcyclicedge(int i, int j){
		edges~=edge(i,1,i-j+1,0);
	}
	void createaliases(){
		int[string] num;
		foreach(i,s;names){
			auto l=iota(1,s.length+1).filter!(l=>s[0..l]!in aliases);
			if(l.empty) aliases[s~(++num[s]).to!string]=cast(int)i;
			else aliases[s[0..l.front]]=cast(int)i;
		}
	}
	//--
	if(file[1]=="alias"){
		file=file[1..$];
		print=true;
	}
	auto input=File(file[1]).byLineCopy;
	foreach(s;input){
		if(s=="---"){break;}
		auto line=s.splitter('|');
		foreach(i,l;line.enumerate){
			if(i!=0){
				if(l.length==0){
					addcyclicedge(cast(int)commands.length-1,cast(int)(i));
				} else {
					addnaturaledge(cast(int)commands.length-1);
			}}
			if(l.length!=0){
				addcommand(l);
			}
		}
	}
	createaliases;
	if(print){
		commands.writeln;
		edges.writeln;
		foreach(k,v;aliases){
			writeln(k," : ",commands[v]);
		}
		return;
	}
	//---
	foreach(i;0..commands.length){
		" [ ".write;
		foreach(k,v;aliases){
			if(v==i){k.write;}
		}
		" ".write;
		commands[i].write;
		" ] ".write;
	}
	foreach(e;edges){
		" ".write;
		'"'.write;
		"{".write;
		foreach(k,v;aliases){
			if(v==e.src){k.write;}
		}
		":".write;
		e.srci.write;
		">".write;
		foreach(k,v;aliases){
			if(v==e.dst){k.write;}
		}
		":".write;
		e.dsti.write;
		"}".write;
		'"'.write;
	}
	foreach(s;input){
		" ".write;
		'"'.write;
		"{".write;
		s.write;
		"}".write;
		'"'.write;
	}
}