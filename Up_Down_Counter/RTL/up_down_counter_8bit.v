module up_down_counter_8bit(clk,rst,load,updown,data_in,count);
  input clk,rst,load,updown;
  input [7:0]data_in;
  output reg [7:0]count;
  always @(posedge clk)
    begin
    if(rst)
      count <= 8'b0;
  else if(load)
    count <= data_in;
  else if(updown)
    count <= count +1'b1;
  else
    count <= count - 1'b1;
    end
endmodule
