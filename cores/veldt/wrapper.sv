module rvfi_wrapper (
	input         clock,
	input         reset,
	`RVFI_OUTPUTS
);
	(* keep *) `rvformal_rand_reg [31:0] instr;

	VeldtFV uut (
	  .clock     (clock),
	  .reset     (reset),
    .word      (instr),
		`RVFI_CONN
	);

endmodule
