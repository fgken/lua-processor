module writeback_mem(clk_wb, n_reset, mem_addr, mem_val);
	input wire clk_wb;
	input wire n_reset;
	
	input wire mem_addr;
	input wire mem_val;

	always @ (posedge clk_wb or negedge n_reset) begin
		if(clk_wb == 1'b0) begin
			$display("writeback_mem: reset");
		end else begin
			$dispaly("writeback_mem: mem_addr=%d, mem_val=%d", mem_addr, mem_val);
		end
	end
endmodule

