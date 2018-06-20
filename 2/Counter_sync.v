module Counter_sync(
	input rst,
	input clk,
	input [11:0] visible_area,
	input [11:0] front_porch,
	input [11:0] sync_pulse,
	input [11:0] back_porch,
	input [11:0] whole_line,
	output reg [11:0] Xpos,
	output reg [11:0] Ypos, 
	output reg out
	
);

reg [31:0] cnt;


always@(posedge clk) 
begin
	if(rst == 0) 
	begin
		cnt <= 0;
		out <= 1;
	end
	if(rst == 1) 
	begin
		cnt <= cnt + 1;
			if(cnt < visible_area)
				Xpos<=cnt;
				Ypos <= Ypos;
				else
				Ypos <= Ypos + 1;
			if(cnt > (visible_area + back_porch) & cnt < (visible_area + back_porch + sync_pulse))
				out <= 0
		else
				out <= 1;
	end
end							
endmodule

