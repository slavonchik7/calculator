
module convert_value_to_digital_led
(
	input 	wire 			clk,
	input 	wire [3:0] 	value,
	output 	wire [6:0]	digital_led_out
);

reg [6:0] digital_led_out_reg;

always @(posedge clk) begin
		case (value)
			7'd0:		digital_led_out_reg <= 7'b1111110;
			7'd1:		digital_led_out_reg <= 7'b0110000;
			7'd2:		digital_led_out_reg <= 7'b1101101;
			7'd3:		digital_led_out_reg <= 7'b1111001;
			7'd4:		digital_led_out_reg <= 7'b0110011;
			7'd5:		digital_led_out_reg <= 7'b1011011;
			7'd6:		digital_led_out_reg <= 7'b1011111;
			7'd7:		digital_led_out_reg <= 7'b1110010;
			7'd8:		digital_led_out_reg <= 7'b1111111;
			7'd9:		digital_led_out_reg <= 7'b1111011;
			default:	digital_led_out_reg <= 7'b0000000;
		endcase
end

assign digital_led_out = digital_led_out_reg;

endmodule
