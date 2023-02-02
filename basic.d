public import std.algorithm;
public import std.string;
public import std.range;
public import std.random;
import std.stdio : _File=File,stdin,_stdout=stdout;

auto File(int i,string s="rb"){
	_File _out;
	_out.fdopen(i,s);
	_out.setvbuf(1024,2);
	return _out;
}
//auto stdin(){
//	
//}
auto stdout(){
	_stdout.setvbuf(1024,2);
	return _stdout;
}
auto writeln(T...)(T t){
	return stdout.writeln(t);
}
auto readln(T...)(T t){
	return stdin.readln(t);
}
auto write(T...)(T t){
	return stdout.write(t);
}