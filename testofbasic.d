import basic;

void main(){
	int i;
	loop:
	writeln(i++);
	assert(i<=100,"working");
	readln();
	goto loop;
}