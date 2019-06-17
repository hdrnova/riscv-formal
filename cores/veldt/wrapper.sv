module rvfi_wrapper (
	input         clock,
	input         reset,
	`RVFI_OUTPUTS
);
	(* keep *) `rvformal_rand_reg [31:0] mem_rdata;
	(* keep *) `rvformal_rand_reg [31:0] mem_instr;

	VeldtFV uut (
		.clock     (clock),
		.reset     (reset),
    .word      (mem_instr),
		.ramOut    (mem_rdata),
		`RVFI_CONN
	);

endmodule
