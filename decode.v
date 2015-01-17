module decode(clk_id, n_reset, inst, opecode, operandA, operandB, operandC);
	input wire clk_id;
	input wire n_reset;
	input wire [31:0] inst;

	input wire [7:0] opecode;
	input wire [7:0] operandA;
	input wire [23:0] operandB;
	input wire [15:0] operandC;

	always @ (posedge clk_id or negedge n_reset) begin
		if(n_reset == 1'b0) begin
			$display("decode: reset");
		end else begin
			opecode <= {2'b0, inst[5:0]};

			case (inst[5:0])
				5'b00001 :
					operandA <= inst[14:6];
					operandB <= 24'd1;
					operandC <= 16'd1;
					$display("decode: opecode=1");
				default :
					operandA <= 8'b0;
					operandB <= 24'b0;
					operandC <= 16'b0;
					$display("decode: opecode=err");
			endcase
		end
	end
endmodule
