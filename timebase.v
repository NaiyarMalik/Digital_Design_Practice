// ============================================================
// By: Naiyar Malik
// ID: rtl9 — Timebase from 1ms tick (sec/min/hr)
// ============================================================
// Goal: count 1ms pulses to generate 1-cycle sec/min/hour pulses. 

module timebase (
  input  logic clk,
  input  logic rst_n,
  input  logic tick_1ms,
  output logic sec_pulse,
  output logic min_pulse,
  output logic hour_pulse
);

  // TODO: ms counter 0..999 (counts tick_1ms events).
  logic [9:0] ms_cnt;

  // TODO: sec counter 0..59 (counts sec_pulse events).
  logic [5:0] sec_cnt;

  // TODO: min counter 0..59 (counts min_pulse events).
  logic [5:0] min_cnt;

  // TODO: Use tick_1ms as clock-enable.

  // TODO: Generate sec_pulse on ms_cnt rollover.
  // Why: single-cycle pulse at terminal count (999 -> 0).

  // TODO: Generate min_pulse on sec_cnt rollover (driven by sec_pulse).
  // Why: cascade timebase hierarchy.

  // TODO: Generate hour_pulse on min_cnt rollover (driven by min_pulse).

  always_ff @ (posedge clk)
    begin
      if(!rst_n)
        begin
          ms_cnt <= 0;
          sec_cnt <= 0;
          min_cnt <= 0;

          sec_pulse <= 0;
          min_pulse <= 0;
          hour_pulse <= 0;
        end
      else
        begin
        if(tick_1ms)
          begin
            if(ms_cnt == 999)
              begin
                ms_cnt <= 0;
                sec_cnt <= sec_cnt + 1;
                sec_pulse <= 1;
              end
            else
              begin
                ms_cnt <= ms_cnt + 1;
                sec_pulse <= 0;
              end

            if(sec_cnt == 59)
              begin
                sec_cnt <= 0;
                min_cnt <= min_cnt + 1;
                min_pulse <= 1;
              end
            else
              begin
                min_pulse <= 0;
              end

            if(min_cnt == 59)
              begin
                min_cnt <= 0;
                hour_pulse <= 1;
              end
            else
              begin
                hour_pulse <= 0;
              end
          end
        end
    end


endmodule