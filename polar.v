module polar(addb_out,clk,BP,BN);
input [1:0] addb_out;
input clk;
output BP,BN;
reg [1:0] polar_out;
reg BP,BN;
reg even;
always @(posedge clk)
if(addb_out==2'b11)
begin
if(even==1)  begin polar_out<=2'b01; end
else         begin polar_out<=2'b11; end
end
else if(addb_out==2'b01||addb_out==2'b10)
     if(even==1)  begin even<=0;polar_out<=2'b11; end
     else         begin even<=1;polar_out<=2'b01; end
else         begin polar_out<=2'b00; end
always @(polar_out)
begin
if(polar_out==2'b01) begin BP=0;BN=1; end
else if(polar_out==2'b11) begin BP=1;BN=0; end
else        begin BP=0;BN=0; end
end
endmodule