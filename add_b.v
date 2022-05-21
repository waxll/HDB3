module add_b(clk,add_in,addb_out);
input clk;
input [1:0] add_in;
output [1:0] addb_out;
reg firstv;
reg counter;
reg [1:0] d [3:0];
always @(posedge clk)
begin	 
d[3]<=d[2];
d[2]<=d[1];
d[1]<=d[0];
d[0]<=add_in;
end
always @(posedge clk)
begin
if(d[0]==2'b11)                 begin counter=0;firstv=0; end   	
else    if(d[0]==2'b01)         begin counter=counter+1;firstv=1; end
else                            begin firstv=1; end
end
assign addb_out=(counter==0)&&(firstv==1)&&(d[0]==2'b11)?2'b10:d[3];    
endmodule
