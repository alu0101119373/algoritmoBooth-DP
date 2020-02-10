module datapath (input wire [2:0] multiplicador, multiplicando, input wire clk, start, cargaA, cargaQ, cargaM, resta, desp, output wire [1:0] q, output wire [5:0] resultado);

    // Cables
    wire [3:0] a_to_sumador, m_to_sumador, q_value;
    wire [3:0] entrada_Q, entrada_M, entrada_A;
    
    // Cable 'basura' para el overflow
    wire aux;

    // Valores a 4 bits
    assign entrada_Q = {multiplicador, 1'b0}; // entrada_Q[0] corresponde a q(-1), mientras que entrada_Q[1] corresponde a q(0)
    assign entrada_M = {multiplicando[2], multiplicando};

    // Registros
    registro4 A(entrada_A, a_to_sumador[3], cargaA, desp, clk, start, a_to_sumador);
    registro4 Q(entrada_Q, a_to_sumador[0], cargaQ, desp, clk, 1'b0, q_value);
    registro4 M(entrada_M, 1'b0, cargaM, 1'b0, clk, 1'b0, m_to_sumador);

    // Sumador
    sum_resta4 sumador(entrada_A, aux, a_to_sumador, m_to_sumador, resta);

    // Salidas
    assign resultado = {a_to_sumador[2:0], q_value[3:1]};

    assign q = {q_value[1], q_value[0]};

endmodule
