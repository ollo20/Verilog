`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/04 15:23:30
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`define	OP_ADD	4'b0000
`define	OP_SUB	4'b0001
//  Bitwise Boolean operation
`define	OP_ID	4'b0010
`define	OP_NAND	4'b0011
`define	OP_NOR	4'b0100
`define	OP_XNOR	4'b0101
`define	OP_NOT	4'b0110
`define	OP_AND	4'b0111
`define	OP_OR	4'b1000
`define	OP_XOR	4'b1001
// Shifting
`define	OP_LRS	4'b1010
`define	OP_ARS	4'b1011
`define	OP_RR	4'b1100
`define	OP_LLS	4'b1101
`define	OP_ALS	4'b1110
`define	OP_RL	4'b1111


module ALU(
    input [15:0] A,
    input [15:0] B,
    input Cin,
    input [3:0] OP,
    output reg [15:0] C
    );
    reg [15:1] T;
    reg Cout;
    always @(*) begin
        case(OP)
            `OP_ADD : begin
                C[0] = A[0]^B[0]^Cin;
                T[1] = (A[0]&B[0])|(B[0]&Cin)|(Cin&A[0]);
                C[1] = A[1]^B[1]^T[1];
                T[2] = (A[1]&B[1])|(B[1]&T[1])|(T[1]&A[1]);
                C[2] = A[2]^B[2]^T[2];
                T[3] = (A[2]&B[2])|(B[2]&T[2])|(T[2]&A[2]);
                C[3] = A[3]^B[3]^T[3];
                T[4] = (A[3]&B[3])|(B[3]&T[3])|(T[3]&A[3]);
                C[4] = A[4]^B[4]^T[4];
                T[5] = (A[4]&B[4])|(B[4]&T[4])|(T[4]&A[4]);
                C[5] = A[5]^B[5]^T[5];
                T[6] = (A[5]&B[5])|(B[5]&T[5])|(T[5]&A[5]);
                C[6] = A[6]^B[6]^T[6];
                T[7] = (A[6]&B[6])|(B[6]&T[6])|(T[6]&A[6]);
                C[7] = A[7]^B[7]^T[7];
                T[8] = (A[7]&B[7])|(B[7]&T[7])|(T[7]&A[7]);
                C[8] = A[8]^B[8]^T[8];
                T[9] = (A[8]&B[8])|(B[8]&T[8])|(T[8]&A[8]);
                C[9] = A[9]^B[9]^T[9];
                T[10] = (A[9]&B[9])|(B[9]&T[9])|(T[9]&A[9]);
                C[10] = A[10]^B[10]^T[10];
                T[11] = (A[10]&B[10])|(B[10]&T[10])|(T[10]&A[10]);
                C[11] = A[11]^B[11]^T[11];
                T[12] = (A[11]&B[11])|(B[11]&T[11])|(T[11]&A[11]);
                C[12] = A[12]^B[12]^T[12];
                T[13] = (A[12]&B[12])|(B[12]&T[12])|(T[12]&A[12]);
                C[13] = A[13]^B[13]^T[13];
                T[14] = (A[13]&B[13])|(B[13]&T[13])|(T[13]&A[13]);
                C[14] = A[14]^B[14]^T[14];
                T[15] = (A[14]&B[14])|(B[14]&T[14])|(T[14]&A[14]);
                C[15] = A[15]^B[15]^T[15];
                Cout = (A[15]&B[15])|(B[15]&T[15])|(T[15]&A[15]);               
                end
            `OP_SUB : begin
                C[0] = A[0]^B[0]^Cin;
                T[1] = (~A[0]&B[0])|(B[0]&Cin)|(Cin&~A[0]);
                C[1] = A[1]^B[1]^T[1];
                T[2] = (~A[1]&B[1])|(B[1]&T[1])|(T[1]&~A[1]);
                C[2] = A[2]^B[2]^T[2];
                T[3] = (~A[2]&B[2])|(B[2]&T[2])|(T[2]&~A[2]);
                C[3] = A[3]^B[3]^T[3];
                T[4] = (~A[3]&B[3])|(B[3]&T[3])|(T[3]&~A[3]);
                C[4] = A[4]^B[4]^T[4];
                T[5] = (~A[4]&B[4])|(B[4]&T[4])|(T[4]&~A[4]);
                C[5] = A[5]^B[5]^T[5];
                T[6] = (~A[5]&B[5])|(B[5]&T[5])|(T[5]&~A[5]);
                C[6] = A[6]^B[6]^T[6];
                T[7] = (~A[6]&B[6])|(B[6]&T[6])|(T[6]&~A[6]);
                C[7] = A[7]^B[7]^T[7];
                T[8] = (~A[7]&B[7])|(B[7]&T[7])|(T[7]&~A[7]);
                C[8] = A[8]^B[8]^T[8];
                T[9] = (~A[8]&B[8])|(B[8]&T[8])|(T[8]&~A[8]);
                C[9] = A[9]^B[9]^T[9];
                T[10] = (~A[9]&B[9])|(B[9]&T[9])|(T[9]&~A[9]);
                C[10] = A[10]^B[10]^T[10];
                T[11] = (~A[10]&B[10])|(B[10]&T[10])|(T[10]&~A[10]);
                C[11] = A[11]^B[11]^T[11];
                T[12] = (~A[11]&B[11])|(B[11]&T[11])|(T[11]&~A[11]);
                C[12] = A[12]^B[12]^T[12];
                T[13] = (~A[12]&B[12])|(B[12]&T[12])|(T[12]&~A[12]);
                C[13] = A[13]^B[13]^T[13];
                T[14] = (~A[13]&B[13])|(B[13]&T[13])|(T[13]&~A[13]);
                C[14] = A[14]^B[14]^T[14];
                T[15] = (~A[14]&B[14])|(B[14]&T[14])|(T[14]&~A[14]);
                C[15] = A[15]^B[15]^T[15];
                Cout = (~A[15]&B[15])|(B[15]&T[15])|(T[15]&~A[15]);               
                end
            `OP_ID: begin
                C = A;
                Cout = 0;
                end
            `OP_NAND: begin
                C = ~(A&B);
                Cout = 0;
                end
            `OP_NOR: begin
                C = ~(A|B);
                Cout = 0;
                end
            `OP_XNOR:begin
                C = ~(A^B);
                Cout = 0;
                end
            `OP_NOT: begin
                C = ~A;
                Cout = 0;
                end
            `OP_AND: begin
                C = A&B;
                Cout = 0;
                end
            `OP_OR: begin
                C = A|B;
                Cout = 0;
                end
            `OP_XOR: begin
               C = A^B;
               Cout = 0;
                end
            `OP_LRS: begin
                C = A >> 1;
                Cout = 0;
                end
            `OP_ARS: begin
                C = A >>> 1;
                C[15] = A[15];
                Cout = 0;
                end
            
            `OP_RR: begin
                C = A >>> 1;
                C[15]=A[0];
                Cout = 0;
                end
            `OP_LLS: begin
                C = A << 1;
                Cout = 0;
                end
            `OP_ALS: begin
                C = A <<< 1;
                Cout = 0;
                end
                
            `OP_RL: begin
                C = A<<<1;
                C[0]=A[15];
                Cout = 0;
                end
           endcase
       end  

endmodule
