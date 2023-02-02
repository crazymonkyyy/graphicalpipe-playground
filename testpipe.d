import std;

void main(string[] s){
	("mkfifo "~s[1]).executeShell;
	File data;
	//data.open(s[1]);
	while (true){
		data.open(s[1]);
		foreach(a;data.byLineCopy){
			a.writeln;
		}
}}