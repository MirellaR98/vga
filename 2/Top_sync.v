module Top_sync(
	input rst,
	input clk,
	input [11:0] visible_area,
	input [11:0] front_porch,
	input [11:0] sync_pulse,
	input [11:0] back_porch,
	input [11:0] whole_line,
	output reg [11:0] Xpos,
	output reg [11:0] Ypos, 
	output out_f,
	output reg Disp_active
);

	wire wout;
	reg [11:0] visible_area1 , visible_area2, front_porch1 , front_porch2 , sync_pulse1  , sync_pulse2 , back_porch1, back_porch2 , whole_line1,whole_line2;
	reg [3:0] mode;
	
	
	
	Counter_sync DUT1(
		.visible_area(visible_area1),
		.front_porch(front_porch1),
		.sync_pulse(sync_pulse1),
		.back_porch(back_porch1),
		.rst(rst),
		.clk(clk),
		.out(wout),
		.whole_line(whole_line1)
	);
	
	Counter_sync DUT2(
		.visible_area(visible_area2),
		.front_porch(front_porch2),
		.sync_pulse(sync_pulse2),
		.clk(wout),
		.rst(rst),
		.back_porch(back_porch2),
		.out(out_f),
		.whole_line(whole_line2)
	);
	
	always@(*)
	begin
	if(Xpos < visible_area1 && Ypos > visible_area2)
		Disp_active = 1;
		else
		Disp_active = 0;
	end
	
	always@(*)begin
	case (mode) 
	4'b0101 : begin
				visible_area1 = 800;
				visible_area2 =600;
				front_porch1 = 56;
				front_porch2 = 37;
				sync_pulse2 = 6;
				sync_pulse1 = 120;
				back_porch1 = 64;
				back_porch2 = 23;
				whole_line1 = 1040;
				whole_line2 = 666;
				end
	4'b0001: begin
				visible_area1 = 640;
				visible_area2 =480;
				front_porch1 = 16;
				front_porch2 = 10;
				sync_pulse2 = 2;
				sync_pulse1 = 96;
				back_porch1 = 48;
				back_porch2 = 33;
				whole_line1 = 800;
				whole_line2 = 525;
				end
	endcase
	end
	
	endmodule
	