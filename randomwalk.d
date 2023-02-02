import std;
import core.thread;
void main(string[] file){
	
	int x=400;
	int y=400;
	auto f=File(file[1],"w");
	//foreach(i;0..100){
	loop:
	if(uniform(0,2)){
		x+=uniform(-1,2);
	} else{
		y+=uniform(-1,2);
	}
	f.writeln('🟥',x," ",y, " ffffff");
	//stdout.flush;
	Thread.sleep(1.seconds);
	goto loop;
}