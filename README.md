# PRÁCTICA 1: Algoritmo de Booth

## Objetivo
El objetivo de esta práctica es realizar un sistema que calcule la multiplicación de dos números con signo (3 bits en C2). Para ello, el sistema se compone de una Unidad de Control, implementada como un autómata de estados finito (máquina FSW tipo Mealy) y un camino de datos que representa las conexiones necesarias para hacer el algoritmo de multiplicación (Algoritmo de Booth).

## Modelo original
La máquina de estados que define la Unidad de Control original es la siguiente:

![Autómata Original](./img/maqEstadosOriginal.png)

## Mejoras implementadas
- Hemos implementado una mejora basada en disminuir el número de estados que recorre la máquina. La máquina de estados mejorada es la siguiente:

![Autómata Mejorado](./img/maqEstadosMejorada.png)