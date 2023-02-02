import std;

void main(string[] file){
	auto colors=File(file[1]).byLineCopy.front.to!dstring.splitter(",").array;
	//colors.writeln;
	while(true){
		dstring s=readln.to!dstring[0..$-1];
		
		if(s[0]=='🟦'){
			int i;
			loop:
			s=s[1..$];
			if(s[0]>='0'&&s[0]<='9'){
				i*=10;
				i+=cast(int)(s[0]-'0');
				goto loop;
			}
			//s=s[1..$];
			s~=" ";
			s~=colors[i];
		}
		if(s[0]=='▫'){
			s~=s[1..3];
			s=s[3..$];
		}
		s.to!string.writeln;
		stdout.flush;
	}
}