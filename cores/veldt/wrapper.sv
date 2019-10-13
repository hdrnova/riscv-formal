module rvfi_wrapper (
	input         clock,
	input         reset,
	`RVFI_OUTPUTS
);
	(* keep *) `rvformal_rand_reg [31:0] mem_rdata;
   (* keep *) wire               mem_valid;
   (* keep *) wire mem_instr;
   (* keep *) wire [31:0] mem_addr;
   (* keep *) wire [31:0] mem_wdata;
   (* keep *) wire [3:0] mem_wstrb;

	VeldtFV uut (
	  .clock     (clock),
	  .reset     (reset),
		     .mem_valid (mem_valid),
		     .mem_instr (mem_instr),
		     .mem_addr  (mem_addr),
		     .mem_wdata (mem_wdata),
		     .mem_wstrb (mem_wstrb),
		     .mem_rdata (mem_rdata),
		`RVFI_CONN
	);

endmodule
