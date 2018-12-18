module kogge(A,B,Cin,S);
// I/O Decleration
input [3:0] A,B;
input Cin;
output [4:0]S;
wire [3:0]P,G;
wire [2:0]C;
// Propogate and Generate 
assign P = A^B;
assign G = A&B;
// carry generation
assign C[0] = G[0];
assign C[1] = (P[1]&G[0])|G[1];
assign C[2] = ((P[2]&P[1])&G[0])|((P[2]&G[1])|G[2]);
assign S[4] = ((P[3]&P[2])&G[1])|((P[3]&G[3])|G[3]);
//sum generation
assign S[0] = P[0]^Cin;
assign S[1] = P[1]^C[0];
assign S[2] = P[2]^C[1];
assign S[3] = P[3]^C[2];
endmodule
