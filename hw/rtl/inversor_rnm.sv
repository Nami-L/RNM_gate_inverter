`timescale 1ns/1ps

nettype real realnet;   // Definición de nettype real

module inverter_rnm (vin, vout);

    input  realnet vin;  // Entrada analógica (voltaje)
    output real vout;   // Salida analógica (voltaje)

  parameter real VDD   = 1.8;    // Voltaje de alimentación
  parameter real Vth   = 0.9;    // Voltaje umbral
  parameter real delta = 0.05;   // Factor de pendiente (V)
    // La delta control a pendiente de la cuvra alrededor del umbral
    // si la delta es muy pequeño entonces la transicion sera casi ideal
    // si la delta es muy grande  la transicción se más suave, modelando casi la realidad
  real temp_out;
  
  // todas las expresiones matematicas para ser reconocidas llevan el $

  always @(vin) begin
    // Modelo suave con función logística sigmoide 
    temp_out = VDD / (1.0 + $exp((vin - Vth)/delta));
    vout = temp_out;
  end

endmodule

