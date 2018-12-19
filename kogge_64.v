module kogge_64(A,B,Cin,S,Cout);
input [63:0]A,B;
output [63:0]S;
input Cin;
output Cout;
wire[6:0]c;
kogge_8 k1(A[7:0],B[7:0],Cin,S[7:0],c[0]);
kogge_8 k2(A[15:8],B[15:8],c[0],S[15:8],c[1]);
kogge_8 k3(A[23:16],B[23:16],c[1],S[23:16],c[2]);
kogge_8 k4(A[31:24],B[31:24],c[2],S[31:24],c[3]);
kogge_8 k5(A[39:32],B[39:32],c[3],S[39:32],c[4]);
kogge_8 k6(A[47:40],B[47:40],c[4],S[47:40],c[5]);
kogge_8 k7(A[55:48],B[55:48],c[5],S[55:48],c[6]);
kogge_8 k8(A[63:56],B[63:56],c[6],S[63:56],Cout);
endmodule

module kogge_8(A,B,Cin,S,Cout);
input [7:0]A,B;
input Cin;
output [7:0]S;
output Cout;
wire c;
kogge k1 (A[3:0],B[3:0],Cin,S[3:0],c);
kogge k2 (A[7:4],B[7:4],c,S[7:4],Cout);
endmodule

module kogge(A,B,Cin,S,Cout);
// I/O Decleration
input [3:0] A,B;
input Cin;
output [3:0]S;
output Cout;
wire [3:0]P,G;
wire [2:0]C;
// Propogate and Generate 
assign P = A^B;
assign G = A&B;
// carry generation
assign C[0] = G[0];
assign C[1] = (P[1]&G[0])|G[1];
assign C[2] = ((P[2]&P[1])&G[0])|((P[2]&G[1])|G[2]);
assign Cout = ((P[3]&P[2])&G[1])|((P[3]&G[3])|G[3]);
//sum generation
assign S[0] = P[0]^Cin;
assign S[1] = P[1]^C[0];
assign S[2] = P[2]^C[1];
assign S[3] = P[3]^C[2];
endmodule