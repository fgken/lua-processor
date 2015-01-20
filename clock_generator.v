module clock_generator(clk, n_reset, clk_if, clk_id, clk_ex, clk_wb);
	input wire clk;
	input wire n_reset;
	
	output wire clk_if;
	output wire clk_id;
	output wire clk_ex;
	output wire clk_wb;

	reg [7:0] counter;

	always @ (posedge clk or negedge n_reset) begin
		if(n_reset == 1'b0) begin
			counter <= 8'b00000001;
			$display("clock_generator: reset");
		end else begin
			if(counter[3] == 1'b1) begin
				counter <= 8'b00000001;
			end else begin
				counter <= counter << 1;
			end
			$display("clock_generator:");
		end
	end

	assign clk_if = counter[0];
	assign clk_id = counter[1];
	assign clk_ex = counter[2];
	assign clk_wb = counter[3];
endmodule

