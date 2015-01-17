module clock_generator(clk, n_reset, clk_if, clk_id, clk_ex, clk_mem, clk_wb);
	input wire clk;
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

	assign counter[0] = clk_if;
	assign counter[1] = clk_id;
	assign counter[2] = clk_ex;
	assign counter[3] = clk_wb;
endmodule

