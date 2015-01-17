module fetch(clk_if, n_reset, pc, inst);
	input wire clk_if;
	input wire n_reset;
	input wire pc;
	output reg [31:0] inst;

	always @ (posedge clk_if or negedge n_reset) begin
		if(n_reset == 1'b0) begin
			inst <= 32'b0;
			$display("fetch: reset");
		end else begin
			inst <= 32'h00000001;
			$display("fetch: fetch instruction, inst = %h", inst);
		end
	end
endmodule
