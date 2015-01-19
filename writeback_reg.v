module writeback_reg(clk_wb, n_reset, reg_id, reg_val);
	input wire clk_wb;
	input wire n_reset;
	
	input wire reg_id;
	input wire reg_val;

	always @ (posedge clk_wb or negedge n_reset) begin
		if(clk_wb == 1'b0) begin
			$display("writeback_reg: reset");
		end else begin
			$dispaly("writeback_reg: reg_id=%d, reg_val=%d", reg_id, reg_val);
		end
	end
endmodule
