
module indicator_number
(
	input wire clk,
	input wire reset,
	input wire load_number,
	input wire load_index,
	input wire [3:0] number_in,
	input wire [2:0] index_in,
	
	output wire [3:0] number_out,
	output wire [2:0] index_out
);



reg [3:0] save_number;
reg [2:0] save_index;

assign number_out = save_number;
assign index_out = save_index;

always @(posedge clk or posedge reset) begin

	if (reset) begin
		save_number <= 3'h00;
		save_index <= 4'h00;
	end else begin
		if (load_number) begin
			save_number <= number_in;
		end
		if (load_index) begin
			save_index <= index_in;
		end
	end
end


endmodule
