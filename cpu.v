module cpu(clk, n_reset);
	input wire clk;
	input wire n_reset;

	wire clk_if;
	wire clk_id;
	wire clk_ex;
	wire clk_wb;

	// Clock generator
	clock_generator clock_generator(clk, n_reset, clk_if, clk_id, clk_ex, clk_wb);

	// Fetch
	reg [31:0] pc;
	reg [31:0] inst;
	fetch fetch(clk_if, n_reset, pc, inst);
	
	// Decode
	reg [7:0] opecode;
	reg [7:0] operandA;
	reg [23:0] operandB;
	reg [15:0] operandC;
	decode decode(clk_id, n_reset, inst, opecode, operandA, operandB, operandC);
	
	// Execute
	execute execute(clk_ex, n_reset, opecode, operandA, operandB, operandC, reg_id, reg_val, mem_addr, mem_val);
	
	// Write Back
	writeback_reg writeback_reg(clk_wb, n_reset, reg_id, reg_val);
	writeback_mem writeback_mem(clk_wb, n_reset, mem_addr, mem_val);

endmodule
