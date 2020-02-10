module controlUnit (input wire clk, start, input wire [1:0] q, output wire resta, desp, fin);

    // Cables
    // wire d3, d2, d1;
    // wire q0, q1, q2;

    wire [2:0] entrada, salida;

    // Biestables
    // ffdc D3 (clk, start, 1'b1, d3, q2);
    // ffdc D2 (clk, start, 1'b1, d2, q1);
    // ffdc D1 (clk, start, 1'b1, d1, q0);

    registro3 D(entrada, 1'b0, 1'b1, 1'b0, clk, start, salida);

    // assign entrada[1:0] = ~salida[1:0];

    // Entradas de los biestables
    // Negadas
    wire neg_q0, neg_q1, negQ0, neg_Q1, neg_Q2;

    assign neg_q0 = ~q[1];
    assign neg_q1 = ~q[0];
    assign neg_Q0 = ~salida[0];
    assign neg_Q1 = ~salida[1];
    assign neg_Q2 = ~salida[2];

    // Bits de la entrada del registro (D3, D2 y D1)
    assign entrada[2] = salida[2] | (salida[1] & (salida[0] | (neg_q0 & neg_q1))) | (q[1] & q[0]);
    assign entrada[1] = (salida[2] & salida[1]) | (neg_Q1 & (salida[0] | (neg_q0 & neg_q1) | (q[1] & q[0])) | (salida[1] & neg_Q0 & ((neg_q0 & q[0]) | (q[1] & neg_q1))));
    assign entrada[0] = (salida[2] & salida[1]) | (neg_Q0 & ((neg_q0 & q[0]) | (q[1] & neg_q1)));
    

    // // Salidas
    // // assign resta = (~q2 & ~q0 & q[1] & ~q[0]) | (~q1 & ~q0 & q[1] & ~q[0]);
    // // assign desp = (~q2 & q0) | (~q1 & q0) | (~q2 & ~q[1] & ~q[0]) | (~q1 & ~q[1] & ~q[0]) | (~q2 & q[1] & q[0]) | (~q1 & q[1] & q[0]);
    // // assign fin = q2 & q1;

    assign resta = neg_Q0 & q[1] & q[0] & (neg_Q2 | neg_Q1);
    assign desp = (salida[0] & (neg_Q2 | neg_Q1)) | (neg_q0 & neg_q1 & (neg_Q2 | neg_Q1)) | (q[1] & q[0] & (neg_Q2 | neg_Q1));
    assign fin = salida[2] & salida[1];

    // // Resta
    // wire R_forAnd21, R_forAnd31, R_forAnd32;

    // or R_or1(neg_Q2, neg_Q1, R_forAnd32);

    // and R_and1(neg_Q0, q[1], R_forAnd21);

    // and R_and2(R_forAnd21, neg_q1, R_forAnd31);
    // and R_and3(R_forAnd31, R_forAnd32, resta);

    // // Desplazamiento
    // wire sum_neg_21, D_forOr11, D_forAnd31, D_forOr12, D_forOr21;
    // wire D_forAnd51, D_forOr22;

    // or D_sum_neg_21(neg_Q2, neg_Q1, sum_neg_21);

    // and D_and1(salida[0], sum_neg_21, D_forOr11);
    // and D_and2(neg_q0, neg_q1, D_forAnd31);
    // and D_and3(D_forAnd31, sum_neg_21, D_forOr12);

    // or D_or1(D_forOr11, D_forOr12, D_forOr21);

    // and D_and4(q[1], q[0], D_forAnd51);
    // and D_and5(D_forAnd51, sum_neg_21, D_forOr22);

    // or D_or2(D_forOr21, D_forOr22, desp);

    // // FIN
    // and fin_and(salida[2], salida[1], fin);

endmodule