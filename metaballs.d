import basic;
void main(){
	struct vec2{ int x; int y;}
	vec2[100] a;
	foreach(ref v;a){
		v.x=uniform(0,200);
		v.y=uniform(0,200);
	}
	"  000000ff".writeln;
	while(true){
		foreach(x;0..200){
		foreach(y;0..200){
			"🟥 ".write;
			x.write(' ');
			y.write(' ');
			(a[].canFind(vec2(x,y))?"ffffffff":"000000ff").writeln;
}}}}