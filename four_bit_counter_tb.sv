module four_bit_counter_tb;
  
  // declare signals: 
  logic clk,  reset;
  logic [3:0] count; 
  logic [3:0] expect_count;

  // clock 
  initial clk = 0;
  always #5 clk = ~clk;
  
  
  // declare the signal 
  four_bit_counter DUT (
    .clk(clk),
    .reset(reset),
    .count(count)
  );
  
  initial begin
    
  // set reset button to 1
  reset = 1;
    
    @(posedge clk); #1; 
    assert(count == 4'b0000)
      else $error("Fail: Reset failed! count=%0d", count);
  
    // release the reset and count
    reset = 0; 
    
     expect_count = 0;
    //let's track the expected count: 
    repeat(16)begin
      @(posedge clk); #1;
     
      expect_count = expect_count + 1'b1;
      assert(count === expect_count)
      else $error("counter mismatch ! count=%0d expected=%0d", count, expect_count);
     
      $display("count = %0d", count);
    end
    
// Check wraparound after 16 cycles; count should be back to 0
    assert (count === 4'b0000)
    else $error("FAIL: Wraparound failed! count=%0d", count);
    $finish;
  end
endmodule
