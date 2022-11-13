//11/6/2022
//VHDL to CPP attempted code

#include <iostream>
#include <vector>
using std::cout;
using std::cin;

//this adder circuit is required in the other subcircuits
void Adder(int x, int y, int cin) {
	//output integers...
	int Co;
	int s;
	//the following are signals that are included in my signals VHDL
	//NOTE: ^ is XOR, & is AND, | is OR
	int a1 = x ^ y;
	//	int a2 = x ^ cin; don't know if this is needed...
	int a3 = x & cin;
	int a4 = y & cin;
	int a5 = x & y;

	//these give the carry out and sum value for the adder...
	Co = a5 | a3 | a4;
	s = a1 & cin;

	std::cout << Co << s << "\n";

};

//VHDL Fig1B
void Fig1B(int x, int x2, int cin, int y, int y2) {
	//note x is M and y is Q 
	//cout and s are outputs of this circuit...

	//signals
	int a1 = x & y;
	int a2 = x2 & y2;

	Adder(a1, a2, cin);
	//and if this works right, this should return the cout and s 
	//that I am looking for

};

//VHDL Fig1C
void Fig1C(int x, int cc, int y, int cin) {
	//signal again
	int a1 = x & y;

	Adder(a1, cc, cin);

};

//now, usin the three subcircuits above, 
//could this be more simple in a class...? 
void Multiplier(std::vector <int> M, std::vector<int> Q) {
	//note  I need to get this to take vectorrr of m and q
	//can I set a vector size that multiplier will take...?

	std::vector <int> Output;
	Output.size(7); //sets the size of the result output to be 7 so 7 digits in length...
	//note that otuput 7 should be the bit of highest significance

	//the first value that can be determined is through an AND gate of m[0] and q[0]


};

//this is just like foo in NETRUN! this is the main function where things can be tackled...
int main(void) {

	return 0;
};

