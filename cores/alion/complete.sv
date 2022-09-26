module testbench (
  input clk,

  output mem_valid,
  output mem_instr,
  output [31:0] mem_addr,
  output [31:0] mem_wdata,
  output [3:0]  mem_wstrb,
  input [31:0]  mem_rdata
);
  reg reset = 0;

  always @(posedge clk)
    reset <= 1;

  `RVFI_WIRES

  alion dut (
    .clk (clk),
    .rst_n (reset),
    .mem_valid (mem_valid),
    .mem_instr (mem_instr),
    .mem_addr  (mem_addr),
    .mem_wdata (mem_wdata),
    .mem_wstrb (mem_wstrb),
    .mem_rdata (mem_rdata),
    `RVFI_CONN
  );

  (* keep *) wire spec_valid;
  (* keep *) wire spec_trap;
  (* keep *) wire [4 : 0] spec_rs1_addr;
  (* keep *) wire [4 : 0] spec_rs2_addr;
  (* keep *) wire [4 : 0] spec_rd_addr;
  (* keep *) wire [`RISCV_FORMAL_XLEN - 1 : 0] spec_rd_wdata;
  (* keep *) wire [`RISCV_FORMAL_XLEN - 1 : 0] spec_pc_wdata;
  (* keep *) wire [`RISCV_FORMAL_XLEN - 1 : 0] spec_mem_addr;
  (* keep *) wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_mem_rmask;
  (* keep *) wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_mem_wmask;
  (* keep *) wire [`RISCV_FORMAL_XLEN - 1 : 0] spec_mem_wdata;

  rvfi_isa_rv32i isa_spec (
    .rvfi_valid    (rvfi_valid    ),
    .rvfi_insn     (rvfi_insn     ),
    .rvfi_pc_rdata (rvfi_pc_rdata ),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),

    .spec_valid    (spec_valid    ),
    .spec_trap     (spec_trap     ),
    .spec_rs1_addr (spec_rs1_addr ),
    .spec_rs2_addr (spec_rs2_addr ),
    .spec_rd_addr  (spec_rd_addr  ),
    .spec_rd_wdata (spec_rd_wdata ),
    .spec_pc_wdata (spec_pc_wdata ),
    .spec_mem_addr (spec_mem_addr ),
    .spec_mem_rmask(spec_mem_rmask),
    .spec_mem_wmask(spec_mem_wmask),
    .spec_mem_wdata(spec_mem_wdata)
  );


  always @* begin
    if (!reset && rvfi_valid && !rvfi_trap) begin
      if (rvfi_insn[6:0] != 7'b1110011)
	assert(spec_valid && !spec_trap);
    end
  end
endmodule
