module up_down_counter_tb();
reg clk,rst,load,updown;
reg [3:0]data;
wire [3:0]count;

up_down_counter DUT(clk,rst,load,updown,data,count);

//.........Generating clock logic...........
initial
begin
clk = 1'b0;
forever 
#5 clk = ~clk;
end

//.........Reset Generating logic.........
task reset;
begin
@(negedge clk)
 rst = 1'b1;
@(negedge clk)
 rst = 1'b0;
end
endtask

//.....Initialising all inputs............
task initialize;
begin
{rst,load,updown,data} = 7'b1010000;
end
endtask

//......Load generating logic............
task load_in(input [3:0]a);
begin
@(negedge clk)
 load = 1'b1;
 data = a;
@(negedge clk)
 load = 1'b0;
end
endtask

//.......Updown logic..........
initial
begin
forever
#100 updown = ~updown;
end

//........Generating delay..........
task delay();
begin
#100;
end
endtask

//......calling all tasks..........
initial
begin
$monitor ("load = %d , data = %d, count = %d",load,data,count);
initialize;
reset;
delay();
load_in(4'b1010);
#50;
load_in(4'b1000);
#50;
load_in(4'b0010);

#500 $finish;

end
endmodule