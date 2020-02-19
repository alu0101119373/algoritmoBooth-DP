#!/bin/sh

iverilog -c datafiles.txt -o multiplicador.out multiplicador_tb.v multiplicador.v
vvp multiplicador.out
