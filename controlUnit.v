module controlUnit (input wire clk, start, input wire [1:0] q, output wire resta, desp, cargaA, cargaQ, cargaM, fin);

  reg [2:0] state, nextstate;

  // Codificacion de los estados

  parameter S0 = 3'b000;
  parameter S1 = 3'b001;
  parameter S2 = 3'b010;
  parameter S3 = 3'b011;
  parameter S4 = 3'b100;
  parameter S5 = 3'b101;
  parameter S6 = 3'b110;
  parameter S7 = 3'b111;

  // Comprobamos el estado a actualizar
  always @(posedge clk, posedge start)
    if (start)
      state <= S0;
    else
      state <= nextstate;

  // Funcion de transicion
  always @(*)
    case (state)
      S0: nextstate = S1;
      S1: nextstate = S2;
      S2: nextstate = S3;
      S3: nextstate = S4;
      S4: nextstate = S5;
      S5: nextstate = S6;
      S6: nextstate = S7;
      S7: nextstate = S7;
      default: nextstate = S0;
    endcase

    // Funcion de salida

    // assign resta = ((state == S8 || state == S2 || state == S4) && q == 2'b10) ? 1 : 0;
    // assign desp = (((state == S8 || state == S2 || state == S4) && (q == 2'b00 || q == 2'b11)) || (state == S1 || state == S3 || state == S5 || state == S6)) ? 1 : 0;
    // assign fin = (state == S6 || state == S7) ? 1 : 0;

    assign cargaA = ((state == S1 || state == S3 || state == S5) && (q == 2'b01 || q == 2'b10)) ? 1 : 0;
    assign cargaQ = (state == S0) ? 1 : 0;
    assign cargaM = (state == S0) ? 1 : 0;
    assign resta = (q == 2'b10) ? 1 : 0;
    assign desp = (state == S2 || state == S4 || state == S6);
    assign fin = (state == S7) ? 1 : 0;

endmodule
