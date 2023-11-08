


`timescale 1ns/10ps
 
module jpeg_tb ();


input clk;
reg signed [15:0] l0_s [3:0];
reg signed [15:0] l1_s [3:0];
reg signed [15:0] l2_s [3:0];
reg signed [15:0] l3_s [3:0];

reg signed [15:0] r0_s [3:0];
reg signed [15:0] r1_s [3:0];
reg signed [15:0] r2_s [3:0];
reg signed [15:0] r3_s [3:0];

reg signed [15:0] s0_s [3:0];
reg signed [15:0] s1_s [3:0];
reg signed [15:0] s2_s [3:0];
reg signed [15:0] s3_s [3:0];

wire signed [15:0] res0_s [3:0];
wire signed [15:0] res1_s [3:0];
wire signed [15:0] res2_s [3:0];
wire signed [15:0] res3_s [3:0];

//reg signed [15:0] res_s;
//wire e_o_s;
 
reg f0_i_s [3:0];
reg f1_i_s [3:0];
reg f2_i_s [3:0];
reg f3_i_s [3:0];

reg r_clk;

reg e0_o_s [3:0];
reg e1_o_s [3:0]; 
reg e2_o_s [3:0];
reg e3_o_s [3:0]; 

always #5 r_clk = (r_clk === 1'b0);
 
jpeg jpeg0(
    .clk(r_clk),
		.l_s(l0_s[0]),
		.r_s(r0_s[0]),
		.s_s(s0_s[0]),
		.e_o_s(e0_o_s[0]),
		.f_i_s(f0_i_s[0]),
		.res_s(res0_s[0])
  
); 

jpeg jpeg1(
    .clk(r_clk),
		.l_s(l1_s[1]),
		.r_s(r1_s[1]),
		.s_s(s1_s[0]),
		.e_o_s(e1_o_s[1]),
		.f_i_s(f1_i_s[1]),
		.res_s(res1_s[0])
  
); 

jpeg jpeg2(
    .clk(r_clk),
		.l_s(l2_s[2]),
		.r_s(r2_s[2]),
		.s_s(s2_s[2]),
		.e_o_s(e2_o_s[2]),
		.f_i_s(f2_i_s[2]),
		.res_s(res2_s[2])
  
); 

jpeg jpeg3(
    .clk(r_clk),
		.l_s(l3_s[3]),
		.r_s(r3_s[3]),
		.s_s(s3_s[3]),
		.e_o_s(e3_o_s[3]),
		.f_i_s(f3_i_s[3]),
		.res_s(res3_s[3])
  
); 

  localparam DEPTH = 64;
  localparam WIDTH = 16;

  //reg r_clk = 1'b0;
  reg r_Wr_DV = 1'b0, r_Rd_En = 1'b0;
  reg [$clog2(DEPTH)-1:0] r_Wr_Addr = 0, r_Rd_Addr = 0;
  reg [WIDTH-1:0] r_Wr_Data = 0;
  wire [WIDTH-1:0] w_Rd_Data;
  
  //always #10 r_Clk <= !r_Clk; // create oscillating clock

  RAM_2Port #(.WIDTH(WIDTH), .DEPTH(DEPTH)) mem0 
  (// Write Signals
  .i_Wr_Clk(r_clk),
  .i_Wr_Addr(r_Wr_Addr),
  .i_Wr_DV(r_Wr_DV),
  .i_Wr_Data(r_Wr_Data),
  // Read Signals
  .i_Rd_Clk(r_clk),
  .i_Rd_Addr(r_Rd_Addr),
  .i_Rd_En(r_Rd_En),
  .o_Rd_DV(),
  .o_Rd_Data(w_Rd_Data)
  );

 initial
		begin
			#19600;
			$finish();
 end

 initial
	begin
	
	# 500 l0_s [0] = 215;
	# 1 r0_s [0] = 217;
	# 1 s0_s [0] = 216;
	# 1 e0_o_s [0]= 1;
  	# 1 f0_i_s [0] = 1;
	# 1 l0_s [0] = 215;
	# 1 r0_s [0] = 217;	
        # 1 s0_s [0] = res0_s [0];
	# 1 f0_i_s [0] = 0;

	# 502 l0_s [0] = 215;
	# 502 r0_s [0]= 217;
	# 502 s0_s [0] = 216;
	# 502 e0_o_s [0] = 0;
  	# 502 f0_i_s [0] = 1;
	# 503 s0_s [0] = res0_s [0];
	# 503 l0_s [0] = 215;
	# 503 r0_s [0] = 217;
	# 503 f1_i_s [0] = 0;
        # 504 s0_s [0] = res0_s [0];

	# 500 l1_s [1] = 216;
	# 500 r1_s [1] = 215;
	# 500 s1_s [1] = 216;
	# 500 e1_o_s [1] = 1;
  	# 500 f1_i_s [1] = 1;
	# 501 l1_s [1] = 216;
	# 501 r1_s [1] = 215;	
        # 501 s1_s [1] = res1_s [1];
	# 501 f1_i_s [1] = 0;

	# 502 l1_s [1] = 216;
	# 502 r1_s [1] = 215;
	# 502 s1_s [1] = 216;
	# 502 e1_o_s [1] = 0;
  	# 502 f1_i_s [1] = 1;
	# 503 s1_s [1] = res1_s [1];
	# 503 l1_s [1] = 216;
	# 503 r1_s [1] = 215;
	# 503 f1_i_s [1] = 0;
        # 504 s1_s [1] = res1_s [1];
	end

 

 initial
   
    begin
      // Required for EDA Playground
      $dumpfile("dump.vcd"); 
      $dumpvars(0);
		end

 initial
  begin
    r_Wr_Data = 'd55;
    repeat(4) @(posedge r_clk); // Give simulation a few clocks to start

    // Fill memory with incrementing pattern
    repeat(DEPTH)
    begin
      r_Wr_DV <= 1'b1;
      @(posedge r_clk);
      r_Wr_Data <= r_Wr_Data + 1;
      r_Wr_Addr <= r_Wr_Addr + 1;
    end
    r_Wr_DV <= 1'b0;

    // Read out incrementing pattern
    repeat(DEPTH)
    begin
      r_Rd_En   <= 1'b1;
      @(posedge r_clk);
      r_Rd_Addr <= r_Rd_Addr + 1;
	  end
    r_Rd_En   <= 1'b0;

    repeat(4) @(posedge r_clk); 

    // Test reading and writing at the same time
    r_Wr_Addr <= 1;
    r_Wr_Data <= 84;
    r_Rd_Addr <= 1;
    r_Rd_En <= 1'b1;
    r_Wr_DV <= 1'b1;
    @(posedge r_clk);
    r_Rd_En <= 1'b0;
    r_Wr_DV <= 1'b0;
    repeat(3) @(posedge r_clk);
    r_Rd_En <= 1'b1;
    @(posedge r_clk);
    r_Rd_En <= 1'b0;
    repeat(3) @(posedge r_clk);

 end
endmodule
