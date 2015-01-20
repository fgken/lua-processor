module execute(clk_ex, n_reset, opecode, operandA, operandB, operandC, reg_id, reg_val, mem_addr, mem_val);
	input wire clk_ex;
	input wire n_reset;

	input wire [7:0] opecode;
	input wire [7:0] operandA;
	input wire [23:0] operandB;
	input wire [15:0] operandC;

	output reg [7:0] reg_id;
	output reg [31:0] reg_val;
	output reg [31:0] mem_addr;
	output reg [31:0] mem_val;

	always @ (posedge clk_ex or negedge n_reset) begin
		if(n_reset == 1'b0) begin
			$display("execute: reset");
		end else begin
			case (opecode[5:0])
				5'b00001 :
					begin
						reg_id <= 8'b01010101;
						reg_val <= 32'd123;
						mem_addr <= 32'd567;
						mem_val <= 32'd999;
						$display("execute: exec opecode = %d", opecode);
					end
				default :
					$display("execute: undefined instruction, opecode = %d", opecode);
			endcase
		end
	end
    	
endmodule
