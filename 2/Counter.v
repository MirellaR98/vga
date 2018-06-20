module Counter(
	input rst ,
	input clk,
	input [3:0] mode,
	output reg Q
	);
	
	reg [31:0] cnt;
	reg [31:0] VAL;
	
	always@(posedge clk) begin
	
	if(rst == 1) begin
		Q<=0; 
		cnt <= 0;
		end
		else begin
		if(cnt == VAL-1)begin
		Q<=~Q;
		cnt<=0;
		end
		else
		cnt<=cnt+1;
		end
		
	case (mode) 
	//4'b0000 : VAL <= 31500000;
	4'b0001 : VAL <= 25175000;
	//4'b0010 : VAL <= 36000000;
	//4'b0011 : VAL <= 34960000;
	//4'b0100 : VAL <= 40000000;
	4'b0101 : VAL <= 50000000; 
	endcase
	end
	endmodule
	