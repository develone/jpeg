


`timescale 1ns/10ps

module jpeg_tb ();


input clk;
reg signed [15:0] l_s;
reg signed [15:0] r_s;
reg signed [15:0] s_s;
wire signed [15:0] res_s;
//reg signed [15:0] res_s;
//wire e_o_s;

reg f_i_s;
reg r_clk;
reg e_o_s;
 
always #5 r_clk = (r_clk === 1'b0);
 
jpeg jpegi(
    .clk(r_clk),
		.l_s(l_s),
		.r_s(r_s),
		.s_s(s_s),
		.e_o_s(e_o_s),
		.f_i_s(f_i_s),
		.res_s(res_s)
  
); 

 initial
		begin
			#19600;
			$finish();
 end

 initial
	begin
	# 500 l_s = 215;
	# 500 r_s = 216;
	# 500 s_s = 217;
	# 250 e_o_s = 1;
  # 250 f_i_s = 1;

	end

 

 initial
    begin
      // Required for EDA Playground
      $dumpfile("dump.vcd"); 
      $dumpvars(0);
		end
endmodule
