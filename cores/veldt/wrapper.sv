module rvfi_wrapper (
	input         clock,
	input         reset,
	`RVFI_OUTPUTS
);
	(* keep *) `rvformal_rand_reg [31:0] ramOut;
	(* keep *) wire               [96:0] ramIn;

	VeldtFV uut (
	  .clock     (clock),
	  .reset     (reset),
		.ramOut    (ramOut),
		.ramIn     (ramIn),
		`RVFI_CONN
	);

endmodule
