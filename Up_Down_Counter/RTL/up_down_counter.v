//.............4-bit UpDown counter.................

module up_down_counter(clk,rst,load,updown,data,count);
input clk,rst,load,updown;
input [3:0]data;
output reg [3:0]count;

always @(posedge clk or posedge rst)
begin

//.........RESEt = 1'b1.........
if(rst) 
count <= 4'b0000;

//..........Load = 1 ,the data should be load into the counter........
else if (load)
count <= data;

//..........if updown= 1 the counter will acts as upcounter.........
else if (updown)
begin
 if(count == 4'b1111)
   count <= 4'b0000;
 else
   count <= count + 1'b1;
end
//..........updown = 0 the counter will acts as downcounter.........
else
begin
 if(count == 4'b0000)
  count <= 4'b1111;
 else
  count <= count - 1'b1;
end
end
endmodule
