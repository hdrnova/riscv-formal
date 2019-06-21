module rvfi_wrapper (
	input         clock,
	input         reset,
	`RVFI_OUTPUTS
);
	(* keep *) wire [31:0] instr;
	(* keep *) wire [31:0] ramOut;
	(* keep *) wire [31:0] ramIn;

	VeldtFV uut (
	  .clock     (clock),
	  .reset     (reset),
    .word      (instr),
		.ramOut    (ramOut),
		.ramIn     (ramIn),
	  `RVFI_CONN
	);

endmodule
