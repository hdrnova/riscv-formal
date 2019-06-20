module rvfi_wrapper (
	input         clock,
	input         reset,
	`RVFI_OUTPUTS
);
	(* keep *) wire [31:0] instr;
	(* keep *) wire [31:0] ramOut;

	VeldtFV uut (
	  .clock     (clock),
	  .reset     (reset),
    .word      (instr),
		.ramOut    (ramOut),
	  `RVFI_CONN
	);

endmodule
