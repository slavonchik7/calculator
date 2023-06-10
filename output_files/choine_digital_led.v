

module choice_digital_led
(
	input 	wire  [0:2] index,
	output 	wire 	[0:7] bitmap
);


assign bitmap = 
~{
	{~index[0] & ~index[1] & ~index[2]},
	{~index[0] & ~index[1] &  index[2]},
	{~index[0] &  index[1] & ~index[2]},
	{~index[0] &  index[1] &  index[2]},
	{ index[0] & ~index[1] & ~index[2]},
	{ index[0] & ~index[1] &  index[2]},
	{ index[0] &  index[1] & ~index[2]},
	{ index[0] &  index[1] &  index[2]}
};


endmodule
