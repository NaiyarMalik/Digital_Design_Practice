// ============================================================
// By: Naiyar Malik 
//ID: rtl2 — 1-Cycle High Pulse Detector (0->1->0)
// ============================================================
// Goal: detect exactly-one-cycle high pulse using 2-cycle history. 

module one_cycle_pulse (
  input  logic clk,
  input  logic rst_n,
  input  logic sig_in,
  output logic onecycle_pulse
);

  // TODO: Two history registers (d1,d2).
  // Why: need a 3-sample window: (d2,d1,current).
  logic d1, d2, curr;

  always_ff @ (posedge clk)
    begin
      
      if(!rst_n)
        begin
          d1 <= 0;
          d2 <= 0;
          curr <= 0;
        end 
      else  
        begin
          d1 <= d2;
          d2 <= curr;
          curr <= sig_in;
        end
    end

  assign onecycle_pulse = (!d1 && d2 && !curr);


endmodule