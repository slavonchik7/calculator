
module draw_screen
(
	input wire 			clk,
	input wire			sdraw,
	input wire 			clear,
	input wire [3:0] value,
	output wire [7:0]	indicator,
	output wire [7:0]	indicator_choice
);

 
wire sload_number;
wire sload_index;

reg [2:0]draw_index;

reg draw_run_flag;
initial draw_run_flag <= 1'b1;

wire [2:0]index_wire;
wire [3:0]number_wire;

convert_value_to_digital_led(
.clk					(clk)					, 
.value				(number_wire)		, 
.digital_led_out	(indicator[6:0])
);

indicator_number storage_draw_struct(
.clk				(clk)				,
.reset			(clear)			,
.load_number	(sload_number)	,
.load_index		(sload_index)	,
.number_in		(value)			,
.index_in		(draw_index)	,
.number_out		(number_wire)	,
.index_out		(index_wire)
);

choice_digital_led choice_dl(
.index 	(index_wire)		, 
.bitmap 	(indicator_choice)
);

assign sload_number = draw_run_flag;
assign sload_index = draw_run_flag;


always @(posedge clk) begin
	
	if (sdraw) begin
		draw_index <= 1'b000;
	end
	
	if (draw_index == 3'b111) begin
		draw_index <= 3'b000;
	end else begin
		draw_index <= draw_index + 1'b1;
	end



		

	
/*

		if (sdraw) begin
		draw_run_flag <= 1'b1;
	end
	
	
	
index <=  3'd4;
	if (sdraw)
		index <=  3'd4;
		sload_number <= 1'b1;
		sload_index <= 1'b1;
	end else begin
		sload_number <= 0'b1
	end
*/
end

endmodule
