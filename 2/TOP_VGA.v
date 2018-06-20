module TOP_VGA(
	output [7:0] R_o,
	output [7:0] G_o,
	output [7:0] B_o,
	output [11:0] Xpos,
	output [11:0] Ypos,
	output Hsync,
	output Vsync,
	output Hsync_neg,
	output Vsync_neg,
	output Disp_activ,
	input [7:0] R_i,
	input [7:0] G_i,
	input [7:0] B_i,
	input clk,
	input rst,
	input [3:0] mode

);

wire [7:0] WR;
wire [7:0] WG;
wire [7:0] WB;
wire [11:0] Wxpos;
wire [11:0] Wypos;
wire [3:0] wmode;
wire wdisp;

assign Hsync = ~Hsync_neg;
assign Vsync = ~Vsync_neg;

	


Counter DUT2(
	.mode(wmode),
	.rst(rst),
	.clk(clk),
	.Q()
);


Top_sync DUT3(
	.rst(rst),
	.clk(clk),
	.Xpos(Wxpos),
	.Ypos(Wypos),
	.Disp_activ(wdisp),
	.outf(),
);




TOP_VGA DUT4(
	.R_i(WR),
	.G_i(WG),
	.B_i(WB),
	.R_o(WR),
	.G_o(WG),
	.B_o(WB),
	.clk(clk),
	.rst(rst),
	.Xpos(Wxpos),
	.Ypos(Wypos),
	.mode(wmode),
	.Disp_activ(wdisp),
	.Hsync(),
	.Vsync(),
	.Hsync_neg(),
	.Vsync_neg()
);

endmodule