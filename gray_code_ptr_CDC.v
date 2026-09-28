// ============================================================
// ID: rtl17 — Binary Pointer + Gray Pointer (CDC/FIFO-style)
// By: Naiyar Malik
// ============================================================
// Goal: maintain binary counter and compute Gray version for safe CDC compare. 

module gray_ptr #(
  parameter int W = 4
) (
  input  logic         clk,
  input  logic         rst_n,
  input  logic         inc,
  output logic [W-1:0] bin_ptr,
  output logic [W-1:0] gray_ptr
);

  always @ (posedge clk)
    begin
      if(!rst_n)
        begin
          bin_ptr <= 0;
        end
      else
        begin
          if(inc)
            begin
              bin_ptr <= bin_ptr + 1;
            end
        end
    end
  assign gray_ptr = bin_ptr ^ (bin_ptr >> 1);

endmodule
