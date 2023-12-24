module up_down_8bit_tb();
  reg clk,rst,load,updown;
  reg [7:0]data_in;
  wire [7:0]count;
  up_down_counter_8bit DUT(clk,rst,load,updown,data_in,count);

  initial
    begin
      clk = 1'b0;
      forever 
        #5 clk = ~clk;
    end
  
task initialize;
    {data_in,load,updown,rst} = 11'b00000010010;
endtask
  
  task reset;
    begin
      @(negedge clk)
      rst = 1'b1;
      @(negedge clk)
      rst = 1'b0;
    end
  endtask

  task load_in(input [7:0]a);
    begin
      @(negedge clk)
      load = 1'b1;
      data_in = a;
      @(negedge clk)
      load = 1'b0;
     end
  endtask

  task delay;
    begin
      #100;
    end
  endtask

  initial
    begin
      $monitor ("load = %d,count = %d",load,count);
      initialize;
      reset;
      delay;
      load_in(8'd200);
      delay;
      delay;
      load_in(8'd100);
    end
  initial
    #1000 $finish;
endmodule
  
  
  
