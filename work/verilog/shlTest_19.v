/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shlTest_19 (
    input clk,
    input rst,
    input button,
    input [3:0] count,
    output reg [15:0] out,
    output reg true,
    output reg [7:0] step
  );
  
  
  
  localparam BEGIN_state = 3'd0;
  localparam C1_state = 3'd1;
  localparam C2_state = 3'd2;
  localparam C3_state = 3'd3;
  localparam C4_state = 3'd4;
  localparam GOOD_state = 3'd5;
  localparam ERROR_state = 3'd6;
  
  reg [2:0] M_state_d, M_state_q = BEGIN_state;
  reg [27:0] M_timer_d, M_timer_q = 1'h0;
  wire [16-1:0] M_shl_out;
  reg [8-1:0] M_shl_io_dip;
  reg [16-1:0] M_shl_a;
  reg [16-1:0] M_shl_b;
  sft_9 shl (
    .clk(clk),
    .rst(rst),
    .io_dip(M_shl_io_dip),
    .a(M_shl_a),
    .b(M_shl_b),
    .out(M_shl_out)
  );
  
  localparam C1A = 16'h696a;
  
  localparam C1B = 16'h0004;
  
  localparam C2A = 16'h696a;
  
  localparam C2B = 16'h0000;
  
  localparam C3A = 16'h7fff;
  
  localparam C3B = 16'h0001;
  
  localparam C4A = 16'h0001;
  
  localparam C4B = 16'h0002;
  
  localparam C1 = 16'h96a0;
  
  localparam C2 = 16'h696a;
  
  localparam C3 = 16'hfffe;
  
  localparam C4 = 16'h0004;
  
  always @* begin
    M_state_d = M_state_q;
    M_timer_d = M_timer_q;
    
    out = 1'h0;
    M_shl_a = 1'h0;
    M_shl_b = 1'h0;
    M_timer_d = M_timer_q + 1'h1;
    M_shl_io_dip = 8'h20;
    true = 1'h0;
    step = 1'h0;
    
    case (M_state_q)
      BEGIN_state: begin
        if (count == 4'h8 & button) begin
          M_timer_d = 1'h0;
          M_state_d = C1_state;
        end
      end
      C1_state: begin
        M_shl_a = 16'h696a;
        M_shl_b = 16'h0004;
        step = 1'h1;
        if (M_timer_q[26+1-:2] == 1'h0) begin
          out = 16'h696a;
        end else begin
          if (M_timer_q[26+1-:2] == 1'h1) begin
            out = 16'h0004;
          end else begin
            if (M_timer_q[26+1-:2] == 2'h2) begin
              out = M_shl_out;
            end else begin
              if (M_timer_q[26+1-:2] == 2'h3) begin
                if (M_shl_out == 16'h96a0) begin
                  M_timer_d = 1'h0;
                  M_state_d = C2_state;
                end else begin
                  M_state_d = ERROR_state;
                end
              end
            end
          end
        end
      end
      C2_state: begin
        M_shl_a = 16'h696a;
        M_shl_b = 16'h0000;
        step = 2'h2;
        if (M_timer_q[26+1-:2] == 1'h0) begin
          out = 16'h696a;
        end else begin
          if (M_timer_q[26+1-:2] == 1'h1) begin
            out = 16'h0000;
          end else begin
            if ((M_timer_q[26+1-:2] == 2'h2)) begin
              out = M_shl_out;
            end else begin
              if (M_timer_q[26+1-:2] == 2'h3) begin
                if ((M_shl_out == 16'h696a)) begin
                  M_timer_d = 1'h0;
                  M_state_d = C3_state;
                end else begin
                  M_state_d = ERROR_state;
                end
              end
            end
          end
        end
      end
      C3_state: begin
        M_shl_a = 16'h7fff;
        M_shl_b = 16'h0001;
        step = 3'h4;
        if (M_timer_q[26+1-:2] == 1'h0) begin
          out = 16'h7fff;
        end else begin
          if (M_timer_q[26+1-:2] == 1'h1) begin
            out = 16'h0001;
          end else begin
            if ((M_timer_q[26+1-:2] == 2'h2)) begin
              out = M_shl_out;
            end else begin
              if (M_timer_q[26+1-:2] == 2'h3) begin
                if (M_shl_out == 16'hfffe) begin
                  M_timer_d = 1'h0;
                  M_state_d = C4_state;
                end else begin
                  M_state_d = ERROR_state;
                end
              end
            end
          end
        end
      end
      C4_state: begin
        M_shl_a = 16'h0001;
        M_shl_b = 16'h0002;
        step = 4'h8;
        if (M_timer_q[26+1-:2] == 1'h0) begin
          out = 16'h0001;
        end else begin
          if (M_timer_q[26+1-:2] == 1'h1) begin
            out = 16'h0002;
          end else begin
            if ((M_timer_q[26+1-:2] == 2'h2)) begin
              out = M_shl_out;
            end else begin
              if (M_timer_q[26+1-:2] == 2'h3) begin
                if (M_shl_out == 16'h0004) begin
                  M_timer_d = 1'h0;
                  M_state_d = GOOD_state;
                end else begin
                  M_state_d = ERROR_state;
                end
              end
            end
          end
        end
      end
      GOOD_state: begin
        if (M_timer_q[27+0-:1] == 1'h1) begin
          true = 1'h1;
        end else begin
          if (M_timer_q[25+0-:1] == 1'h1) begin
            out = 16'hff00;
          end else begin
            if (M_timer_q[25+0-:1] == 1'h0) begin
              out = 16'h0000;
            end
          end
        end
      end
      ERROR_state: begin
        if (M_timer_q[25+0-:1] == 1'h1) begin
          out = 16'h00ff;
        end else begin
          out = 16'h0000;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_timer_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_timer_q <= M_timer_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule