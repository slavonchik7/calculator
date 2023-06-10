
module draw_screen
(
	input wire 			clk,
	input wire [3:0] value,
	output wire [7:0]	indicator,
	output wire [7:0]	indicator_choice
);

 
reg sload_number;
reg sload_index;
reg number;
reg [2:0]index;

wire [2:0]index_wire;
wire [3:0]number_wire;


convert_value_to_digital_led(
.clk					(clk)					, 
.value				(number_wire)		, 
.digital_led_out	(indicator[6:0])
);

indicator_number storage_draw_struct(
.clk				(clk)				,
.reset			(1'b0)			,
.load_number	(sload_number)	,
.load_index		(sload_index)	,
.number_in		(value)			,
.index_in		(index)			,
.number_out		(number_wire)	,
.index_out		(index_wire)
);

choice_digital_led choice_dl(
.index 	(index_wire)		, 
.bitmap 	(indicator_choice)
);


always @(posedge clk) begin
	index <=  3'd4;
	sload_number <= 1'b1;
	sload_index <= 1'b1;
end

endmodule
