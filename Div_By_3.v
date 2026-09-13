// ============================================================
// ID: rtl7 — Divisible-by-3 FSM (serial bits)
// By: Naiyar Malik
// ============================================================
// Goal: track remainder mod 3 (0/1/2) as bits stream in; div_by_3 when rem==0. 

module div_by_3 (
  input  logic clk,
  input  logic rst_n,
  input  logic bit_in,
  output logic div_by_3
);

  // TODO: Choose bit-append convention and document.
  // Why: transitions depend on whether bit_in is appended as LSB or MSB.

  // TODO: Define 3 FSM states = remainder {0,1,2}.
  typedef enum logic [1:0] {REM0, REM1, REM2} state_t;

  state_t curr, next; 

  // TODO: State register (always_ff) with reset to REM0.
  always_ff @ (posedge clk)
    begin
      if(!rst_n)
        begin
          curr <= REM0; 
        end
      else
        curr <= next;
    end
  
  always_comb
    begin
      case(curr)
        REM0:
          if(!bit_in)
            next = REM0;
          else
            next = REM1;

        REM1:
          if(!bit_in)
            next = REM2;
          else
            next = REM0;

        REM2:
          if(!bit_in)
            next = REM1;
          else
            next = REM2;
      endcase

      div_by_3 = (curr == REM0) ? 1'b1 : 1'b0;

    end

  // TODO: Next-state logic derived from modulo update.

  // TODO: Output logic.

endmodule
