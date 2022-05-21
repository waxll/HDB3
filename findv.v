module findv(clk,P1,N1,out1,out2);
input P1,N1,clk;
output out1,out2;
reg [1:0] counter1;
reg [1:0] counter2;
reg [1:0] out1;
reg [1:0] out2; 
always @(posedge clk)
begin
if(P1==2'b01)
begin
   if(counter2==2'b10)  counter1<=2'b00; 
   else   begin 
          counter1<=counter1+1;
          if(counter1==2'b10)
          begin out1<=2'b11; counter1<=2'b00; end
          else begin out1<=2'b01;end 
          end
end
else out1=2'b00;
end
always @(posedge clk)
begin
if(N1==2'b01)
begin
    if(counter1==2'b10)  counter2<=2'b00; 
    else  begin 
          counter2<=counter2+1;
          if(counter2==2'b10)
          begin out2<=2'b11; counter1<=2'b00; end 
          else begin out2<=2'b01; end
          end
end
else  out2<=2'b00; 
end
endmodule
