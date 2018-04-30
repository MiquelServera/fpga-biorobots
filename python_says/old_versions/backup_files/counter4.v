//counter4.v
module counter4(input clk, output [7:0] data);
wire clk;
reg[7:0] data=0;

//-- Parametro para el prescaler
parameter N=25;

//--Reloj de salida del prescaler

wire clk_pres;

//Instanciar el prescaler
prescaler #(.N(N))
  pres1 (
    .clk_in(clk),
    .clk_out(clk_pres)
    );

//-- Incrementar el contador en cada flanco de subida
always @(posedge(clk_pres)) begin
  data <= data +1;
end

endmodule
