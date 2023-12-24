module up_down_8bit_tb();
  reg clk,rst,load,updown;
  reg [7:0]data_in;
  wire [7:0]count;
  up_down_counter_8bit DUT(clk,rst,load,updown,data_in,count);

  initial
    begin
      clk
    end
