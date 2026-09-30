// ============================================================
// ID: rtl11 — Clock Divide-by-3 (~50% duty, glitch-free)
// ============================================================
// Goal: odd divider with ~50% duty typically uses posedge+negedge paths. 

module clk_div3_50 (
  input  logic clk,
  input  logic rst_n,
  output logic clk_div3_50
);

  // TODO: Posedge counter (mod-3) to generate a pulse/phase signal.
  // Why: establishes /3 sequencing on posedges.
  logic [1:0] pos_cnt;

  // TODO: Create a registered pulse on posedge at a chosen count.
  // Why: registered control ensures glitch-free combine.
  logic rise_pulse_reg;

  // TODO: Capture/transfer on negedge (negedge flop).
  // Why: uses both edges to balance duty cycle for odd divide.
  logic neg_pulse_reg;

  // TODO: Combine registered terms to form output clock (e.g., OR).

  // TODO: Reset all internal regs.


  always_ff @ (posedge clk)
    if(!rst_n)
      begin
        pos_cnt <= 0;
        rise_pulse_reg <= 0;
        neg_pulse_reg <= 1;
        
      end
    else
      begin
        pos_cnt <= pos_cnt + 1;
        if(pos_cnt == 2'b01)
          rise_pulse_reg <= 1'b1;
        else
          rise_pulse_reg <= 1'b0;
      end

  always_ff @ (negedge clk or negedge rst_n)
    begin
      if(!rst_n)
        begin
          pos_cnt <= 0;
          rise_pulse_reg <= 0;
          neg_pulse_reg <= 1;
        end
      else
        begin
          if(pos_cnt == 2'b01)
            neg_pulse_reg <= 1'b1;
          else
            neg_pulse_reg <= 0; 
        end
    end

  assign clk_div3_50 = rise_pulse_reg | neg_pulse_reg;
endmodule
