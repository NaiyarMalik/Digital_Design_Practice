// ============================================================
// By: Naiyar Malik
// ID: rtl3 — Sequence Detector FSM (10110)
// ============================================================
// Goal: FSM asserts 1-cycle match when serial pattern 10110 completes. 

module seq_det_10110 (
  input  logic clk,
  input  logic rst_n,
  input  logic bit_in,
  output logic match_pulse
);

  typedef enum logic [2:0]{
    IDLE,
    GOT1,
    GOT10,
    GOT101,
    GOT1011
  } states_t;

  states_t curr, nxt;

  always_ff @ (posedge clk)
    begin
      if(!rst_n)
          curr <= IDLE;
      else
          curr <= nxt;
    end

  always_comb 
    begin
      case(curr)
        IDLE:
          begin
            if(bit_in)
              nxt = GOT1;
            else
              nxt = IDLE;
          end
        
        GOT1:
          begin
            if(!bit_in)
              nxt = GOT10;
            else
              nxt = GOT1;
          end
        
        GOT10:
          begin
            if(bit_in)
              nxt = GOT101;
            else
              nxt = IDLE;
          end

        GOT101:
          begin
            if(bit_in)
              nxt = GOT1011;
            else
              nxt = GOT10;
          end

        GOT1011:
          begin
            if(!bit_in)
              nxt = IDLE;
            else
              nxt = GOT1;
          end

        default:
          nxt = IDLE;
      endcase
    end

  assign match_pulse = (curr == GOT1011) && !bit_in;

endmodule