// ============================================================
// ID: rtl15 — CDC 2-FF Synchronizer (1-bit)
// By: Naiyar
// ============================================================
// Goal: synchronize async signal into dst_clk domain using two flops. 

module two_ff_sync (
  input  logic dst_clk,
  input  logic dst_rst_n,
  input  logic async_sig_in,
  output logic sig_sync
);

  logic s1, s2;

  always_ff @ (posedge dst_clk or negedge dst_rst_n)
    begin
    
      if(!dst_rst_n)
        begin
          s1 <= 0;
          s2 <= 0;
        end
      else
        begin
          s2 <= s1;
          s1 <= async_sig_in;
        end
    end

  assign sig_sync = s2;

endmodule
