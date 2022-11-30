//11/6/2022
//VHDL to CPP attempted code

#include <iostream>
#include <vector>
//#include <bitset> //potential way to transfer to binary values...
using std::cout;
using std::cin;
//using std::bitset;


std::vector <char> Output(7);
//sets the size of the result output to be 7 so 7 digits in length...
//note that otuput 7 should be the bit of highest significance

//these vectors must act as BUFFERS and must be adjusted by the subcircuits
//as well as used by the circuit to come....
std::vector <char> Cout(8);
std::vector <char> PP1(3), PP2(3); //don't know if you can do this but i'm going to try...
//this should be helpful to allow counts to be moved around and used in each piece of a circuit
//check to see how these count up or down....this is going to be important for the multiplier...
//might be able to make these adjust into the subcircuits.


//this adder circuit is required in the other subcircuits
//this circuit only takes SINGLE BIT VALUES
//SINGLE BIT FULL ADDER IS ALL THAT IS REQUIRED HERE!!! (note that char)

void Adder(char x, char y, char cin) {
	//output integers...
	char Co;
	char s;
	/*the following are signals that are included in my signals VHDL
	//NOTE: ^ is XOR, & is AND, | is OR
	int a1 = x ^ y;
	//	int a2 = x ^ cin; don't know if this is needed...
	int a3 = x & cin;
	int a4 = y & cin;
	int a5 = x & y;
	*/
	//add a way to say hey!!!! overflow isn't okay!!


	//these give the carry out and sum value for the adder...
	//condensed version of the signals
	Co = (x & y) | (y & cin) | (x & cin);
	s = cin ^ (x ^ y);

	//test display to verify adder
	std::cout << Co << s << "\n"; //be careful and make sure to check far more

};

//VHDL Fig1B
void Fig1B(char x, char x2, char cin, char y, char y2) {
	//note x is M and y is Q 
	//cout and s are outputs of this circuit...

	//signals
	char a1 = x & y;
	char a2 = x2 & y2;

	Adder(a1, a2, cin);
	//and if this works right, this should return the cout and s 
	//that I am looking for

	//try if else statements in both fig1B and fig1C to allow for S and Co to be 
	//transfered and moved about in the vectors
};

//VHDL Fig1C
void Fig1C(char x, char cc, char y, char cin) {
	//signal again
	char a1 = x & y;

	Adder(a1, cc, cin);
};

//now, usin the three subcircuits above, 
//could this be more simple in a class...? 
void Multiplier(std::vector <char> M, std::vector<char> Q) {
	//note  I need to get this to take vectorrr of m and q
	//can I set a vector size that multiplier will take...?

	//Note: these functions may need to be done backwards to how it is in VHDL
	// This is due to vector pushback order...
	   //the first value that can be determined is through an AND gate of m[0] and q[0]
	Output.push_back(M[0] & Q[0]); //P(0) in total circuit


	//first row of values: VHDL u1 port maps of Fig1B
	Fig1B(M[0], M[1], Q[0], Q[0], 0); //gives P[1]
	Fig1B(M[1], M[2], Q[0], Q[1], Cout[0]); //place the carry value from u1 to cout(0)...
	Fig1B(M[2], M[3], Q[0], Q[0], Cout[1]);
	Fig1B(M[3], 0, Q[0], Q[0], Cout[2]);

	//second row of values: VHDL w1 port maps of Fig1C
	Fig1C(M[0], PP1[3], Q[2], 0);//gives P[2]
	Fig1C(M[1], PP1[2], Q[2], Cout[3]);
	Fig1C(M[2], PP1[1], Q[2], Cout[4]);
	Fig1C(M[3], PP1[0], Q[2], Cout[5]);

	//Last line and the final outputs of P : VHDL n1
	Fig1C(M[0], PP2[3], Q[3], 0); //P[3]
	Fig1C(M[1], PP2[2], Q[3], Cout[6]);//P[4]
	Fig1C(M[2], PP2[1], Q[3], Cout[7]);//P[5]
	Fig1C(M[3], PP2[0], Q[3], Cout[8]);//P[6] AND [P7] if there is a output carry...

};

//this is just like foo in NETRUN! this is the main function where things can be tackled...
int main(void) {

	//could allow an input in here...but will simply test another way...
	//Adder(0b0, 0b0, 0b0);

	return 0;
};

