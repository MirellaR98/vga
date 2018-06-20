module Counter_tb();
	reg rst_t;
	reg clk_t;
	reg [3:0] mode_t;
	wire Q_t;
	
	integer i;
	initial begin
	clk_t = 0 ;
	forever #1 clk_t = ~ clk_t;
	end
	
	initial begin
		rst_t = 1'b1;
		mode_t = 4'b0000;
	#2 rst_t = 1'b0;
	#50 mode_t = 4'b0001;
	#67 mode_t = 4'b0101;
	end
		
	
	Counter DUT(
		.rst(rst_t),
		.clk(clk_t),
		.Q(Q_t),
		.mode(mode_t)
	);
	endmodule