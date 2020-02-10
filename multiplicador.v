`timescale 1 ns / 10 ps
module multiplicador (input wire [2:0] multiplicador, multiplicando, input wire clk, start, output wire [5:0] resultado, output wire fin);
  
  // Cables de interconexion
  wire sub, desp;
  wire [1:0] q;

  // Camino de datos
  // Le pasamos al camino de datos las señales de control proporcionadas por la unidad de control
  // También le pasamos el multiplicador, el multiplicando, y CLK
  datapath dp(multiplicador, multiplicando, start, fin, clk, sub, desp, q, resultado);
  
  // La UC va a recibir el CLK y posiblemente la señal de start, asi como proporcionar la señal de FIN
  // Tambien recibira q0 y q-1 del camino de datos
  controlUnit uc(clk, start, q, sub, desp, fin);
  
endmodule
