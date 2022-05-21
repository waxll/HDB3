module jia(in1,in2,clk,out0);
input [1:0] in1;
input [1:0] in2;
input clk;
output out0;
reg [1:0] a;
reg [1:0] b;
always @(posedge clk)
begin
a<=in1;
b<=in2;
end
assign out0=a+b;
endmodule
