///////////////////////////////////////////////////////////////////////////
// MODULE: CPU for TSC microcomputer: cpu.v
// Author: 
// Description: 

// DEFINITIONS
`define WORD_SIZE 16    // data and address word size

// INCLUDE files
// "opcode.v" consists of "define" statements for
                        // the opcodes and function codes for all instructions

// MODULE DECLARATION
module cpu (

  output reg readM,                       // read from memory
  output [`WORD_SIZE-1:0] address,    // current address for data
  inout [`WORD_SIZE-1:0] data,        // data being input or output
  input inputReady,                   // indicates that data is ready from the input port
  input reset_n,                      // active-low RESET signal
  input clk,                          // clock signal

  // for debuging/testing purpose
  output reg [`WORD_SIZE-1:0] num_inst,   // number of instruction during execution
  output [`WORD_SIZE-1:0] output_port // this will be used for a "WWD" instruction
);
    reg [`WORD_SIZE-1:0] instruction;
    wire ALUsrc, jump, reg_dst, reg_write, imm_to_reg;
    wire [3:0] ALUOp;           
    wire [3:0] opcode;          //opcode for control unit
    wire [5:0] function_code;   //function code for control unit
    reg [15:0] PC_current;      // current PC address
    wire [15:0] PC_plus1;       // PC +! address
    wire [15:0] PC_jump;        // PC jump address
    wire [15:0] PC_next;        // next PC address
    
    assign address = PC_current;        
    assign PC_plus1 = PC_current + 1; 
    assign PC_jump = {PC_current[15:12],instruction[11:0]};
    assign PC_next = (jump) ? PC_jump : PC_plus1;
    
    assign opcode = instruction[15:12];
    assign function_code = instruction[5:0];
    
always@(posedge clk) begin
    if(!reset_n) begin
        num_inst <= 16'd0;
        PC_current <= 16'd0;
        readM <= 1'b0;
    end
    else begin
        num_inst <= num_inst + 1;
        if(num_inst == 16'd0) PC_current <= 16'd0;
        else PC_current <= PC_next;
        readM <= 1'b1;
    end
end

always@ (posedge inputReady) begin
    readM = 1'b0;
    instruction = data;    
end


Datapath datapath
(
    .clk(clk),
    .reset_n(reset_n),
    .ALUOp(ALUOp),
    .ALUsrc(ALUsrc),
    .jump(jump),
    .reg_dst(reg_dst),
    .reg_write(reg_write),
    .imm_to_reg(imm_to_reg),
    .output_port(output_port),
    .instruction(instruction)
);

Control_Unit control_unit
(
    .opcode(opcode),
    .reset_n(reset_n),
    .function_code(function_code),
    .ALUOp(ALUOp),
    .ALUsrc(ALUsrc),
    .jump(jump),
    .reg_dst(reg_dst),
    .reg_write(reg_write),
    .imm_to_reg(imm_to_reg)
);
endmodule
//////////////////////////////////////////////////////////////////////////


