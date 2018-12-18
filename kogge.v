module kogge(A,B,Cin,S,Cout);
// I/O Decleration
input [3:0] A,B;
input Cin;
output [3:0]S;
output Cout;
wire [2:0]C,X,Y;
wire [1:0]M,N;
wire [3:0]P,G;
// Propogate and Generate 
assign P = A^B;
assign G = A&B;
//Intermediate propogate bit generation
// level 1
assign X[0] = P[1]&P[0];
assign X[1] = P[2]&P[1];
assign X[2] = P[3]&P[2];
// level 2
assign M[0] = X[1]^P[0];
assign M[1] = X[2]^P[1];
//Intermediate Generate bit generation
// level 1
assign Y[0] = (P[1]&G[0])|G[1]; 
assign Y[1] = (P[2]&G[1])|G[2];
assign Y[2] = (P[3]&G[3])|G[3];
// level 2
assign N[0] = (X[0]&G[0])|Y[1];
assign N[1] = (X[2]&G[1])|Y[2];
// carry generation
assign C[0] = G[0];
assign C[1] = Y[0];
assign C[2] = N[0];
assign Cout = N[1];
//sum generation
assign S[0] = P[0]^Cin;
assign S[1] = P[1]^C[0];
assign S[2] = P[2]^C[1];
assign S[3] = P[3]^C[2];
endmodule
