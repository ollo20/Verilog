`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/04 15:17:43
// Design Name: 
// Module Name: Control_Unit
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
`include "opcodes.v" 

module Control_Unit(
    input[3:0] opcode,
    input [5:0] function_code,
    input reset_n,
    output reg [3:0] ALUOp,
    output reg ALUsrc, jump, reg_dst, reg_write,
    output reg imm_to_reg // ALU output과 zero extended immdiate(LHI) 중에서 write data를 고르는 control 인자
);
always@(*) begin
    if(!reset_n) begin
        jump = 1'b0;
        reg_dst = 1'b0;
        ALUsrc = 1'b0;
        reg_write = 1'b0;
        imm_to_reg = 1'b0;
        ALUOp = 4'b0000;
    end
    else begin
        case(opcode)
            //R type
            `OPCODE_R_Type: begin
                // case ADD
                case(function_code)
                    `FUNC_ADD: begin
                        jump = 1'b0;
                        reg_dst = 1'b1;
                        ALUsrc = 1'b0;
                        reg_write = 1'b1;
                        imm_to_reg = 1'b0;
                        ALUOp = 4'b0000;
                    end
                // case WWD
                    `FUNC_WWD: begin
                        jump = 1'b0;
                        reg_dst = 1'b1;
                        ALUsrc = 1'b0;
                        reg_write = 1'b0;
                        imm_to_reg = 1'b0;
                        ALUOp = 4'b0000;
                    end
                // other case는 추가로 반영 
                    default: begin
                        jump = 1'b0;
                        reg_dst = 1'b0;
                        ALUsrc = 1'b0;
                        reg_write = 1'b0;
                        imm_to_reg = 1'b0;  
                        ALUOp = 4'b0000; 
                    end
                endcase
            end
            //ADI opcode
            `OPCODE_ADI: begin
                jump = 1'b0;
                reg_dst = 1'b0;
                ALUsrc = 1'b1;
                reg_write = 1'b1;
                imm_to_reg = 1'b0;  
                ALUOp = 4'b0000; 
            end
            
            //LHI opcode
            `OPCODE_LHI: begin
                jump = 1'b0;
                reg_dst = 1'b0;
                ALUsrc = 1'b0;
                reg_write = 1'b1;
                imm_to_reg = 1'b1;  
                ALUOp = 4'b0000;         
            end
            
            //JMP opcode
            `OPCODE_JMP: begin
                jump = 1'b1;
                reg_dst = 1'b0;
                ALUsrc = 1'b0;
                reg_write = 1'b0;
                imm_to_reg = 1'b0;  
                ALUOp = 4'b0000;  
            end
            default: begin
                jump = 1'b0;
                reg_dst = 1'b0;
                ALUsrc = 1'b0;
                reg_write = 1'b0;
                imm_to_reg = 1'b0;  
                ALUOp = 4'b0000;  
            end
        endcase
    end
end
endmodule
