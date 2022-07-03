//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/04 16:44:25
// Design Name: 
// Module Name: opcodes
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


`define FUNC_ADD 6'd0
`define FUNC_SUB 6'd1
`define FUNC_AND 6'd2
`define FUNC_ORR 6'd3
`define FUNC_NOT 6'd4
`define FUNC_TCP 6'd5
`define FUNC_SHL 6'd6
`define FUNC_SHR 6'd7
`define FUNC_WWD 6'd28


`define OPCODE_R_Type 4'd15
`define OPCODE_ADI 4'd4
`define OPCODE_ORI 4'd5
`define OPCODE_LHI 4'd6
`define OPCODE_LWD 4'd7
`define OPCODE_SWD 4'd8
`define OPCODE_BNE 4'd0
`define OPCODE_BEQ 4'd1
`define OPCODE_BGZ 4'd2
`define OPCODE_BLZ 4'd3
`define OPCODE_JMP 4'd9
`define OPCODE_JAL 4'd10

