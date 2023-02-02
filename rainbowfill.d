import std;
void main(string[] file){
	enum lookup="0123456789abcdef";
	foreach(x;0..255){
	foreach(y;0..255){
		writeln('🟥',x," ",y," ",
		lookup[x/16],
		lookup[x%16],
		lookup[y/16],
		lookup[y%16],"77");
}}}