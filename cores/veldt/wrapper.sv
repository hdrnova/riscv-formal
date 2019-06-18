module rvfi_wrapper (
	input         clock,
	input         reset,
	`RVFI_OUTPUTS
);
	(* keep *) wire [31:0] ramData;
	(* keep *) wire [31:0] instr;

	VeldtFV uut (
	  .clock     (clock),
	  .reset     (reset),
          .word      (instr),
          .ramOut    (ramData),
	  `RVFI_CONN
	);

endmodule
