// ============================================================
// ID: rtl13 — Glitch-Free Clock Gating Cell (ICG-style)
// By: Naiyar Malik
// ============================================================
// Goal: latch enable when clk is low, AND with clk to avoid glitches. 

module icg_cell (
  input  logic clk_in,
  input  logic enable,
  output logic clk_gated
);

  
  logic en_latched;

  always_latch
    begin
      if(!clk_in)
        begin
          en_latched <= enable;
        end
    end

  assign clk_gated = clk_in & en_latched;

endmodule
