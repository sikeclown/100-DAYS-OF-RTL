`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:20:27 03/14/2023 
// Design Name: 
// Module Name:    jk_ff 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module jk_ff (
    input j, k, clk, rst, 
    output reg q, qbar
    );


parameter HOLD = 2'b00, SET = 2'b10, RESET = 2'b01, TOGGLE = 2'b11;
reg q1, q1bar;

always@(*)
begin
    case({j,k})
    HOLD: q1=q;
    RESET: q1=1'b0;
    SET: q1=1'b1;
    TOGGLE: q1=~q;
    default: q1=1'bz;
    endcase 
    q1bar=~q1;
end

always@(posedge clk)
begin
    if(rst)begin
    q<=1'b0;
    qbar<=1'b1;
    end
    
    else begin
    q<=q1;
    qbar<=q1bar;
    end
end

endmodule
