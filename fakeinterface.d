import std;
void main(){
	auto f=File("bar","w");
	f.writeln("I have started");
	f.flush;
	"🕛".writeln;
	stdout.flush;
	while(true){
		f.writeln(readln);
		f.flush;
		import core.thread;
		Thread.sleep(1.seconds);
		"🕛".writeln;
		stdout.flush;
	}
}