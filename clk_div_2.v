// ============================================================
// Naiyar Malik
// ID: rtl10 — Clock Divide-by-2
// ============================================================
// Goal: toggle output every rising edge -> clk/2. 

module clk_div2 (
  input  logic clk,
  input  logic rst_n,
  output logic clk_div2
);


  always_ff @ (posedge clk or negedge rst_n)
    if(!rst_n)
        clk_div2 <= 0;
    else
      clk_div2 <= ~clk_div2;

endmodule