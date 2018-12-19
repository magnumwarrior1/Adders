module ripple (A,B,Cin,S,Cout);
input [63:0]A,B;
input Cin;
output [63:0]S;
output Cout;
wire [6:0]c;
FA8 k1(A[7:0],B[7:0],Cin,S[7:0],c[0]);
FA8 k2(A[15:8],B[15:8],c[0],S[15:8],c[1]);
FA8 k3(A[23:16],B[23:16],c[1],S[23:16],c[2]);
FA8 k4(A[31:24],B[31:24],c[2],S[31:24],c[3]);
FA8 k5(A[39:32],B[39:32],c[3],S[39:32],c[4]);
FA8 k6(A[47:40],B[47:40],c[4],S[47:40],c[5]);
FA8 k7(A[55:48],B[55:48],c[5],S[55:48],c[6]);
FA8 k8(A[63:56],B[63:56],c[6],S[63:56],Cout);
endmodule

module FA8(A,B,Cin,S,Cout);
input [7:0]A,B;
input Cin;
output [7:0]S;
output Cout;
wire [6:0]c;
FA f1 (A[0],B[0],Cin,S[0],c[0]);
FA f2 (A[1],B[1],c[0],S[1],c[1]);
FA f3 (A[2],B[2],c[1],S[2],c[2]);
FA f4 (A[3],B[3],c[2],S[3],c[3]);
FA f5 (A[4],B[4],c[3],S[4],c[4]);
FA f6 (A[5],B[5],c[4],S[5],c[5]);
FA f7 (A[6],B[6],c[5],S[6],c[6]);
FA f8 (A[7],B[7],c[6],S[7],Cout);
endmodule

module FA(A,B,Cin,S,Cout);
input A,B,Cin;
output S,Cout;
assign S = A ^ B ^ Cin;
assign Cout = (A&B)| ((A^B)&Cin);
endmodule
