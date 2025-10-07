`timescale 1ns/1ps

module tb_inverter_rnm;

    // Señales
    real vin;
    real vout;

    // Instanciar el inversor RNM
    inverter_rnm I1 (.vin(vin), .vout(vout));

    // Parámetros
    parameter real VSS =0.0;
    parameter real VDD = 1.8;
    real i;

    initial begin
        // Inicializar
         vin = 0;
             // Opcional: monitorear salida
            $display("\n[%t] === Inicio Simulación  ===", $realtime);

        $monitor("t=%0t ns, vin=%0.10f, vout=%0.10f", $realtime, vin, vout);

         repeat (6) begin


            subir_voltaje(VSS,VDD);
            bajar_voltaje(VDD,VSS);

           $display("\n[%t] === Simulación %0d ===", $realtime,i);
         end
            $display("\n[%t] === Simulación completada ===", $realtime);
            $finish;            
 
    end
  
  // Definir tareas
  task automatic subir_voltaje(input real inicio,input real fin);
           for (i = inicio; i <= fin; i = i + 0.1) begin
            vin = i;
             #0.1;
         end
  endtask
  task automatic bajar_voltaje(input real fin,input real inicio);
         for (i=fin; i >= inicio; i = i - 0.1 ) begin
            vin = i;
             #0.1;
         end
  endtask
        // $finish;
// #0.1 vin = 0.0;
// #0.1 vin = 0.1;
// #0.1 vin = 0.2;
// #0.1 vin = 0.3;
// #0.1 vin = 0.4;
// #0.1 vin = 0.5;
// #0.1 vin = 0.6;
// #0.1 vin = 0.7;
// #0.1 vin = 0.8;
// #0.1 vin = 0.9;
// #0.1 vin = 1.0;
// #0.1 vin = 1.1;
// #0.1 vin = 1.2;
// #0.1 vin = 1.3;
// #0.1 vin = 1.4;
// #0.1 vin = 1.5;
// #0.1 vin = 1.6;
// #0.1 vin = 1.7;
// #0.1 vin = 1.8;
// #0.1 vin = 1.7;
// #0.1 vin = 1.6;
// #0.1 vin = 1.5;
// #0.1 vin = 1.4;
// #0.1 vin = 1.3;
// #0.1 vin = 1.2;
// #0.1 vin = 1.1;
// #0.1 vin = 1.0;
// #0.1 vin = 0.9;
// #0.1 vin = 0.8;
// #0.1 vin = 0.7;
// #0.1 vin = 0.6;
// #0.1 vin = 0.5;
// #0.1 vin = 0.4;
// #0.1 vin = 0.3;
// #0.1 vin = 0.2;
// #0.1 vin = 0.1;
// #0.1 vin = 0.0;

//     end

// DIFERENCIAS ENTRE AUTOMATIC Y STATIC
// AUTOMATIC si queremos que el task se ehjecute limpio en cada llamada
// STATIC si queremos recordas valores enter llamados




    initial begin
        // time format (unidad de tiempo, precision-decimales,sufijo,ancho minimo del campo)
        $timeformat(-12, 3, " ps", 12);
          $fsdbDumpvars; 
    end

endmodule

