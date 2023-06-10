
module draw_screen
(
	input wire 			clk;
	input wire [15:0] value;
	output wire [7:0]	indicator;
	output wire [7:0]	indicator_choice;
);

 
reg sload_number;
reg sload_index;
reg number;
reg index;




indicator_number storage_draw_struct(
.clk				(clk)
.reset			(1'b0)
.load_number	(sload_number)
.load_index		(sload_index)
.number_in		(number)
.index_in		(index)
.number_out		()
.index_out		()
);


endmodule
