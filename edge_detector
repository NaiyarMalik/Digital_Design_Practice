// ============================================================
// By: Naiyar Malik
// ID: rtl1 — Edge / Toggle Detector
// ============================================================
// Goal: detect rising, falling, and any toggle using previous-sample compare. 

module edge_toggle_detect (
  input  logic clk,
  input  logic rst_n,
  input  logic sig_in,
  output logic rise_pulse,
  output logic fall_pulse,
  output logic toggle_pulse
);

  logic sig_prev = 1'b0;
  logic sig_curr = 1'b0;

  always_ff @ (posedge clk)
    begin
      if(!rst_n)
        begin
          sig_prev <= 0;
          rise_pulse = 1'b0;
          fall_pulse = 1'b0;
          toggle_pulse = 1'b0;
        end
      else
        begin
          sig_prev = sig_curr;
          sig_curr = sig_in;
        end
    end 

  always_comb
    begin
        if((sig_prev != sig_curr) && (sig_curr == 1'b1))
          begin
            rise_pulse = 1'b1;
            fall_pulse = 1'b0;
            toggle_pulse = 1'b1;
          end
        else if((sig_prev != sig_curr) && (sig_curr == 1'b0))
          begin
            rise_pulse = 1'b0;
            fall_pulse = 1'b1;
            toggle_pulse = 1'b1;
          end
        else
          begin
            rise_pulse = 1'b0;
            fall_pulse = 1'b0;
            toggle_pulse = 1'b0;
          end    
    end

endmodule