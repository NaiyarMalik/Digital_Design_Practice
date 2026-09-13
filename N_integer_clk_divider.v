// ============================================================
// ID: rtl12 — Clock Divide-by-N (~50% duty)
// Naiyar Malik
// ============================================================
// Goal: support even/odd N; keep output glitch-free. 

module clk_divN #(
  parameter int N = 4
) (
  input  logic clk,
  input  logic rst_n,
  output logic clk_divN
);

  logic [2:0] edge_val;
  logic [2:0] counter;

  always @ (posedge clk)
    begin
      edge_val <= (N/2)-1;

      if(!rst_n)
        begin
          counter <= 0;
          edge_val <= 0;
          clk_divN <= 0;
        end
      else
        begin
          counter <= (counter + 1'b1) % (N);
          if(counter <= edge_val)
            clk_divN <= 1'b1;
          else
            clk_divN <= 1'b0;
        end
    end
  // TODO: Validate N >= 2 (optional assert).
  // Why: divider must have a meaningful period.

  // TODO: Even N strategy.



  // TODO: Odd N strategy.
  // Why: ~50% duty for odd N generally needs dual-edge or more complex FSM.


endmodule
