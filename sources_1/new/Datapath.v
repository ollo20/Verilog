`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/04 15:16:18
// Design Name: 
// Module Name: Datapath
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


module Datapath(
    input clk,
    input reset_n,
    input ALUsrc, jump, reg_dst, reg_write, imm_to_reg,
    input [3:0] ALUOp,
    input [15:0] instruction,
    output [15:0] output_port
);
    wire [1:0] RF_read_addr1;       //first read register address for RF
    wire [1:0] RF_read_addr2;       //second read register address for RF
    wire [1:0] RF_write_addr;       //write register address for RF
    wire [15:0] RF_read_data1;      //read data from RF_read_addr1
    wire [15:0] RF_read_data2;      //read data from RF_read_addr2
    wire [15:0] RF_write_data;      //write data for RF
    wire [15:0] Read_data2;         //mux choice between RF_read_data2 and sign-extended immdiate
    wire [15:0] ALU_Output;         // ALU output
    wire [15:0] zero_extended_imm;  //zero extended immdiate
    wire [15:0] sign_extended_imm;  //sign extended immdiate
    

    assign RF_read_addr1 = instruction[11:10];
    assign RF_read_addr2 = instruction[9:8];
    assign RF_write_addr = (reg_dst == 1'b1) ? instruction[7:6] : instruction[9:8];
    
    RF register_file
    (
        .addr1(RF_read_addr1),
        .addr2(RF_read_addr2),
        .addr3(RF_write_addr),
        .data3(RF_write_data),
        .write(reg_write),
        .clk(clk),
        .reset_n(reset_n),
        .data1(RF_read_data1),
        .data2(RF_read_data2)
    );
        
    assign zero_extended_imm = {instruction[7:0],8'd0};
    assign sign_extended_imm = {{8{instruction[7]}},instruction[7:0]};
    
    assign Read_data2 = (ALUsrc == 1'b1) ? sign_extended_imm: RF_read_data2;
    
    assign RF_write_data = (imm_to_reg == 1'b1) ? zero_extended_imm: ALU_Output;
    
    assign output_port = RF_read_data1;
    
    ALU alu(.OP(ALUOp),.A(RF_read_data1),.B(Read_data2),.Cin(1'b0),.C(ALU_Output));  
endmodule
