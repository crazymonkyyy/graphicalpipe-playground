import std;
void main(string[] file){
	int i;
	while(true){
		readln;
		writeln("🟥",i%1000," ",i/1000," ffffffff");
		stdout.flush;
		i++;
		assert(i<10000000);
}}