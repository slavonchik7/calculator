
module calculator
(
	input wire button,
	input wire [7:4] key_in,
	output wire [3:0] key_out,
	output wire [7:0] led,
	output wire [7:0] indicator, /* indicator[7] - it is dot point */
	output wire [7:0] indicator_choise,
	input wire clk
);


reg [7:0] led_reg;
initial led_reg <= 8'hff;

reg [24:0] counter;
initial counter <= 25'd0;

reg [19:0] counter_fps;
initial counter_fps <= 20'd0;

reg button_reg;
initial button_reg <= 1'b0;
 
reg [3:0] key_out_reg;
reg [3:0] key_in_reg;



reg [3:0] save_key_in_reg;
reg [3:0] column_index;
reg [3:0] line_index;
reg flag_read_line;
initial flag_read_line <= 1'b0;



reg [2:0] index_num;
initial index_num <= 3'd4;

reg [3:0] digital_number;

assign led = led_reg;
assign key_out = key_out_reg;

wire [7:0] choice_dl_output;


reg [1:0] key_read_cnt_reg;


/*
choice_digital_led choice_dl(index_num, indicator_choise);
convert_value_to_digital_led(clk, digital_number, indicator[6:0]);
*/

reg draw_clk;
initial draw_clk <= 1'b0;

reg draw_signal;
initial draw_signal <= 1'b0;

draw_screen(
.clk 					(clk)					,
.sdraw				(draw_signal)		,
.clear				(1'b0)				,
.value				(digital_number)	,
.indicator			(indicator)			,
.indicator_choice (indicator_choise)
);



always @(posedge clk) begin
	if (counter == 25'd25000000) begin
		
		draw_signal <= 1'b1;
		/*
		indicator_choise <= choice_dl_output;
		 
		indicator <= indicator_wire;
		
		indicator <= ~indicator; 
		led_reg <= ~led_reg;
		*/
		counter <= 1'b1;
		index_num <= 3'd4;

		if (digital_number == 4'd9) begin
			digital_number <= 4'd0;
		end else begin
			digital_number <= digital_number + 1'b1;
		end
/*		
		if (index_num == 3'd7) begin
			index_num <= 0;
		end else begin
			index_num <= index_num + 1'b1;
		end
	end else if (counter == 25'd1000000) begin
		key_in_reg <= key_in;
		
		if (key_in_reg != 4'b0111) begin
			key_out_reg <= 4'b0111;
			led_reg[7:4] <= key_out;
			led_reg[3:0] <= key_in;
		end else begin
			led_reg <= 8'h00;
		end
		
			
	key_in_reg <= key_in;
	if (key_in_reg != 4'b0000) begin
		if (key_read_cnt_reg == 2'b00) begin
			key_out_reg <= 4'b1101;
		end else if (key_read_cnt_reg == 2'b01) begin
			if (key_in_reg == 4'b1101) begin
				led_reg <= 8'h00;
			end
		end else begin
			key_read_cnt_reg <= 2'b00;
		end
		key_read_cnt_reg <= key_read_cnt_reg + 1'b1;
	end else begin
		key_read_cnt_reg <= 2'b00;
	end
	
*/

	end else begin
		counter <= counter + 1'b1;
		draw_signal <= 1'b0;
	end

	if (counter_fps == 20'd100000) begin
		
		save_key_in_reg <= key_in;
		column_index <= save_key_in_reg;

		if (flag_read_line) begin
			line_index <= key_in;
			led_reg[3:0] <= line_index;
		end else begin
			key_out_reg <= 4'b1011;
			column_index <= key_in;
			led_reg[7:4] <= column_index;
			if(column_index == 4'b1011) begin
				digital_number <= 4'd0;
			end
		end
		
		
		
		
		
		flag_read_line <= ~flag_read_line;
		/*
		key_out_reg <= 4'b0111;
		led_reg[3:0] <= key_in;
	*/
		counter_fps <= 20'd0;
	end else begin
		counter_fps <= counter_fps + 1'b1;
	end


	/*
	if (counter_fps == 20'd1000000) begin
		indicator_choise <= 8'h02;
		indicator <= ~indicator;
		counter_fps <= 20'd0;
	end else begin
		counter_fps <= counter_fps + 1'b1;
	end
	*/
end


/*
always @(posedge clk) begin
	if (counter == 25'd7) begin
		if (key_in == 4'b1000) begin
			key_out_reg <= 4'b0111;
		end 
	end else if (counter == 25'd8) begin 
		counter <= 25'd0;
		if (key_in == 4'b0111) begin
			led_reg <= 8'h00;
		end
	end else begin
		counter <= counter + 1'b1;
		led_reg <= 8'hff;
	end
	
end

assign key_out = key_out_reg;


always @(posedge clk) begin
	button_reg <= button;
	if (button == 1'b1) begin		
		if (counter == 25'd25000000) begin
			counter <= 25'd0;
			led_reg <= ~led_reg;
		end else  begin
			counter <= counter + 1'b1;
		end
	end
end

assign led = led_reg;
*/


endmodule 