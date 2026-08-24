// ============================================================
// Naiyar Malik
// ID: rtl4 — Pattern 10110 Anywhere in Last N Samples
// ============================================================
// Goal: shift-register window + decode all alignments. 

module pattern_in_window #(
  parameter int N = 8, parameter int K = 5, parameter PATTERN = 5'b10110 ) (
  input  logic clk,
  input  logic rst_n,
  input  logic bit_in,
  output logic found
);

  logic [N-1:0] shreg;


  logic match0, match1, match2, match3;

  always_ff @ (posedge clk)
    begin
      if(!rst_n)
        shreg <= 0;
      else
        begin

          shreg = shreg >> 1;
          shreg[N-1] = bit_in;

        end
    end

  always_comb
    begin
      match0 <= {shreg[N-1], shreg[N-2], shreg[N-3], shreg[N-4], shreg[N-5]} == 5'b10110;
          
      match1 <= {shreg[N-2], shreg[N-3], shreg[N-4], shreg[N-5], shreg[N-6]} == 5'b10110;
      
      match2 <= {shreg[N-3], shreg[N-4], shreg[N-5], shreg[N-6], shreg[N-7]} == 5'b10110;
      
      match3 <= {shreg[N-4], shreg[N-5], shreg[N-6], shreg[N-7], shreg[N-8]} == 5'b10110;
    
      found <= match0 || match1 || match2 || match3;
    end


endmodule