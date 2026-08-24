// ============================================================
// ID: rtl5 — Debounce + Synchronize + Rising Pulse
// ============================================================
// Goal: 2FF sync async input, require stable-high for >=2 cycles, pulse on rise. 

module debounce_sync (
  input  logic clk,
  input  logic rst_n,
  input  logic async_in,
  output logic debounced_level,
  output logic debounced_rise_pulse
);

  // TODO: 2FF synchronizer (s1,s2).
  // Why: reduce metastability risk when bringing async_in into clk domain.
  logic s1, s2;

  always_ff @ (posedge)

  // TODO: Stability filter state.
  // Why: require 2 consecutive high samples before asserting debounced_level.
  // Options: 2-bit history shift register, or small counter.
  logic [1:0] hi_hist;

  // TODO: Edge detect on debounced_level.


  // TODO: always_ff: synchronizer + filter + delayed debounced.

  // TODO: Filter rule.
  // Why: ">=2 cycles high" acceptance; optionally do symmetric deassert on 2 lows.

  // TODO: debounced_rise_pulse equation.
  // Why: 1-cycle pulse generation.
  // debounced_rise_pulse = debounced_level & ~debounced_d;

endmodule