import std;

void main(){
	auto foo=File(); foo.fdopen(42);
	foreach(s;foo.byLineCopy){
		s.writeln;
}}