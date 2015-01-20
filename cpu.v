module cpu(clk, n_reset);
	input wire clk;
	input wire n_reset;

	wire clk_if;
	wire clk_id;
	wire clk_ex;
	wire clk_wb;

	// Clock generator
	clock_generator clock_generator(
		.clk		(clk),
		.n_reset	(n_reset),
		.clk_if		(clk_if),
		.clk_id		(clk_id),
		.clk_ex		(clk_ex),
		.clk_wb		(clk_wb)
	);

	// Fetch
	reg [31:0] pc;
	wire [31:0] inst;
	fetch fetch(
		.clk_if		(clk_if),
		.n_reset	(n_reset),
		.pc			(pc),
		.inst		(inst)
	);
	
	// Decode
	wire [7:0] opecode;
	wire [7:0] operandA;
	wire [23:0] operandB;
	wire [15:0] operandC;
	decode decode(
		.clk_id		(clk_id),
		.n_reset	(n_reset),
		.inst		(inst),
		.opecode	(opecode),
		.operandA	(operandA),
		.operandB	(operandB),
		.operandC	(operandC)
	);
	
	// Execute
	wire [7:0] reg_id;
	wire [31:0] reg_val;
	wire [31:0] mem_addr;
	wire [31:0] mem_val;

	execute execute(
		.clk_ex		(clk_ex),
		.n_reset	(n_reset),
		.opecode	(opecode),
		.operandA	(operandA),
		.operandB	(operandB),
		.operandC	(operandC),
		.reg_id		(reg_id),
		.reg_val	(reg_val),
		.mem_addr	(mem_addr),
		.mem_val	(mem_val)
	);
	
	// Write Back
	writeback_reg writeback_reg(
		.clk_wb		(clk_wb),
		.n_reset	(n_reset),
		.reg_id		(reg_id),
		.reg_val	(reg_val)
	);

	writeback_mem writeback_mem(
		.clk_wb		(clk_wb),
		.n_reset	(n_reset),
		.mem_addr	(mem_addr),
		.mem_val	(mem_val)
	);

endmodule
