module four_bit_counter (
  input logic clk,
  input logic reset,
  output logic [3:0] count 
);
  always_ff @(posedge clk)begin 
   
    if (reset) begin
    count <= 4'b0000;   
    end
    else begin
    count <= count + 1'b1; 
    end
  end
endmodule
