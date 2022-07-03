`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/04 15:25:00
// Design Name: 
// Module Name: RF
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
`define WORD_SIZE 16 
module RF(
    input [1:0] addr1,
    input [1:0] addr2,
    input [1:0] addr3,
    input [`WORD_SIZE-1:0] data3,
    input write,
    input clk,
    input reset_n,
    output reg [`WORD_SIZE-1:0] data1,
    output reg [`WORD_SIZE-1:0] data2
    );
    reg [15:0] reg1;
    reg [15:0] reg2;
    reg [15:0] reg3;
    reg [15:0] reg4;
    
    always @(reset_n) begin
        if(!reset_n) begin
            reg1 <= 16'b0;
            reg2 <= 16'b0;
            reg3 <= 16'b0;
            reg4 <= 16'b0;
        end 
    end    
    
    always @(*) begin
        case(addr1)
            0:  data1 <= reg1;
            1:  data1 <= reg2;
            2:  data1 <= reg3; 
            3:  data1 <= reg4;
        endcase
        case(addr2)
            0:  data2 <= reg1;
            1:  data2 <= reg2;
            2:  data2 <= reg3; 
            3:  data2 <= reg4;
        endcase 
    end    
    always @(posedge clk) begin
        if(write)
            case(addr3)
                0: reg1 <= data3;
                1: reg2 <= data3;           
                2: reg3 <= data3;           
                3: reg4 <= data3;  
            endcase
      end
      
endmodule

