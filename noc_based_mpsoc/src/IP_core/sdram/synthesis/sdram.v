// sdram.v

// Generated using ACDS version 13.0 156 at 2013.08.15.18:11:33

`timescale 1 ps / 1 ps
module sdram (
		input  wire        clk_clk,                //        clk.clk
		input  wire        reset_reset_n,          //      reset.reset_n
		input  wire [24:0] sdram_s1_address,       //   sdram_s1.address
		input  wire [3:0]  sdram_s1_byteenable_n,  //           .byteenable_n
		input  wire        sdram_s1_chipselect,    //           .chipselect
		input  wire [31:0] sdram_s1_writedata,     //           .writedata
		input  wire        sdram_s1_read_n,        //           .read_n
		input  wire        sdram_s1_write_n,       //           .write_n
		output wire [31:0] sdram_s1_readdata,      //           .readdata
		output wire        sdram_s1_readdatavalid, //           .readdatavalid
		output wire        sdram_s1_waitrequest,   //           .waitrequest
		output wire [12:0] sdram_wire_addr,        // sdram_wire.addr
		output wire [1:0]  sdram_wire_ba,          //           .ba
		output wire        sdram_wire_cas_n,       //           .cas_n
		output wire        sdram_wire_cke,         //           .cke
		output wire        sdram_wire_cs_n,        //           .cs_n
		inout  wire [31:0] sdram_wire_dq,          //           .dq
		output wire [3:0]  sdram_wire_dqm,         //           .dqm
		output wire        sdram_wire_ras_n,       //           .ras_n
		output wire        sdram_wire_we_n,        //           .we_n
		output wire        sdram_clk_clk           //  sdram_clk.clk
	);

	wire    up_clocks_0_sys_clk_clk;            // up_clocks_0:sys_clk -> [rst_controller:clk, sdram_controller:clk]
	wire    rst_controller_reset_out_reset;     // rst_controller:reset_out -> sdram_controller:reset_n
	wire    rst_controller_001_reset_out_reset; // rst_controller_001:reset_out -> up_clocks_0:reset

	sdram_sdram_controller sdram_controller (
		.clk            (up_clocks_0_sys_clk_clk),         //   clk.clk
		.reset_n        (~rst_controller_reset_out_reset), // reset.reset_n
		.az_addr        (sdram_s1_address),                //    s1.address
		.az_be_n        (sdram_s1_byteenable_n),           //      .byteenable_n
		.az_cs          (sdram_s1_chipselect),             //      .chipselect
		.az_data        (sdram_s1_writedata),              //      .writedata
		.az_rd_n        (sdram_s1_read_n),                 //      .read_n
		.az_wr_n        (sdram_s1_write_n),                //      .write_n
		.za_data        (sdram_s1_readdata),               //      .readdata
		.za_valid       (sdram_s1_readdatavalid),          //      .readdatavalid
		.za_waitrequest (sdram_s1_waitrequest),            //      .waitrequest
		.zs_addr        (sdram_wire_addr),                 //  wire.export
		.zs_ba          (sdram_wire_ba),                   //      .export
		.zs_cas_n       (sdram_wire_cas_n),                //      .export
		.zs_cke         (sdram_wire_cke),                  //      .export
		.zs_cs_n        (sdram_wire_cs_n),                 //      .export
		.zs_dq          (sdram_wire_dq),                   //      .export
		.zs_dqm         (sdram_wire_dqm),                  //      .export
		.zs_ras_n       (sdram_wire_ras_n),                //      .export
		.zs_we_n        (sdram_wire_we_n)                  //      .export
	);
`ifdef MODEL_TECH

assign sdram_clk_clk =  clk_clk;
assign up_clocks_0_sys_clk_clk = clk_clk;


`else

	sdram_up_clocks_0 up_clocks_0 (
		.CLOCK_50    (clk_clk),                            //       clk_in_primary.clk
		.reset       (rst_controller_001_reset_out_reset), // clk_in_primary_reset.reset
		.sys_clk     (up_clocks_0_sys_clk_clk),            //              sys_clk.clk
		.sys_reset_n (),                                   //        sys_clk_reset.reset_n
		.SDRAM_CLK   (sdram_clk_clk)                       //            sdram_clk.clk
	);

`endif	
	
	altera_reset_controller #(
		.NUM_RESET_INPUTS        (1),
		.OUTPUT_RESET_SYNC_EDGES ("deassert"),
		.SYNC_DEPTH              (2)
	) rst_controller (
		.reset_in0  (~reset_reset_n),                 // reset_in0.reset
		.clk        (up_clocks_0_sys_clk_clk),        //       clk.clk
		.reset_out  (rst_controller_reset_out_reset), // reset_out.reset
		.reset_in1  (1'b0),                           // (terminated)
		.reset_in2  (1'b0),                           // (terminated)
		.reset_in3  (1'b0),                           // (terminated)
		.reset_in4  (1'b0),                           // (terminated)
		.reset_in5  (1'b0),                           // (terminated)
		.reset_in6  (1'b0),                           // (terminated)
		.reset_in7  (1'b0),                           // (terminated)
		.reset_in8  (1'b0),                           // (terminated)
		.reset_in9  (1'b0),                           // (terminated)
		.reset_in10 (1'b0),                           // (terminated)
		.reset_in11 (1'b0),                           // (terminated)
		.reset_in12 (1'b0),                           // (terminated)
		.reset_in13 (1'b0),                           // (terminated)
		.reset_in14 (1'b0),                           // (terminated)
		.reset_in15 (1'b0)                            // (terminated)
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS        (1),
		.OUTPUT_RESET_SYNC_EDGES ("deassert"),
		.SYNC_DEPTH              (2)
	) rst_controller_001 (
		.reset_in0  (~reset_reset_n),                     // reset_in0.reset
		.clk        (clk_clk),                            //       clk.clk
		.reset_out  (rst_controller_001_reset_out_reset), // reset_out.reset
		.reset_in1  (1'b0),                               // (terminated)
		.reset_in2  (1'b0),                               // (terminated)
		.reset_in3  (1'b0),                               // (terminated)
		.reset_in4  (1'b0),                               // (terminated)
		.reset_in5  (1'b0),                               // (terminated)
		.reset_in6  (1'b0),                               // (terminated)
		.reset_in7  (1'b0),                               // (terminated)
		.reset_in8  (1'b0),                               // (terminated)
		.reset_in9  (1'b0),                               // (terminated)
		.reset_in10 (1'b0),                               // (terminated)
		.reset_in11 (1'b0),                               // (terminated)
		.reset_in12 (1'b0),                               // (terminated)
		.reset_in13 (1'b0),                               // (terminated)
		.reset_in14 (1'b0),                               // (terminated)
		.reset_in15 (1'b0)                                // (terminated)
	);

endmodule


//Legal Notice: (C)2013 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sdram_sdram_controller_test_component_ram_module (
                                                          // inputs:
                                                           data,
                                                           rdaddress,
                                                           rdclken,
                                                           wraddress,
                                                           wrclock,
                                                           wren,

                                                          // outputs:
                                                           q
                                                        )
;

  output  [ 31: 0] q;
  input   [ 31: 0] data;
  input   [ 24: 0] rdaddress;
  input            rdclken;
  input   [ 24: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [ 31: 0] mem_array [33554431: 0];
  wire    [ 31: 0] q;
  reg     [ 24: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      read_address = rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

  integer i;
initial for(i=0; i<33554431; i= i+1'b1) mem_array[i]= i+ 32'hFFFF0000;
   // $readmemh("sdram_sdram_controller_test_component.dat", mem_array);
	
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "UNUSED",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 32,
//           lpm_ram_dp_component.lpm_widthad = 25,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sdram_sdram_controller_test_component (
                                               // inputs:
                                                clk,
                                                zs_addr,
                                                zs_ba,
                                                zs_cas_n,
                                                zs_cke,
                                                zs_cs_n,
                                                zs_dqm,
                                                zs_ras_n,
                                                zs_we_n,

                                               // outputs:
                                                zs_dq
                                             )
;

  inout   [ 31: 0] zs_dq;
  input            clk;
  input   [ 12: 0] zs_addr;
  input   [  1: 0] zs_ba;
  input            zs_cas_n;
  input            zs_cke;
  input            zs_cs_n;
  input   [  3: 0] zs_dqm;
  input            zs_ras_n;
  input            zs_we_n;

  wire    [ 23: 0] CODE;
  wire    [ 12: 0] a;
  wire    [  9: 0] addr_col;
  reg     [ 14: 0] addr_crb;
  wire    [  1: 0] ba;
  wire             cas_n;
  wire             cke;
  wire    [  2: 0] cmd_code;
  wire             cs_n;
  wire    [  3: 0] dqm;
  wire    [  2: 0] index;
  reg     [  2: 0] latency;
  wire    [  3: 0] mask;
  wire    [ 31: 0] mem_bytes;
  wire             ras_n;
  reg     [ 24: 0] rd_addr_pipe_0;
  reg     [ 24: 0] rd_addr_pipe_1;
  reg     [ 24: 0] rd_addr_pipe_2;
  reg     [  3: 0] rd_mask_pipe_0;
  reg     [  3: 0] rd_mask_pipe_1;
  reg     [  3: 0] rd_mask_pipe_2;
  reg     [  2: 0] rd_valid_pipe;
  wire    [ 24: 0] read_addr;
  wire    [ 31: 0] read_data;
  wire    [  3: 0] read_mask;
  wire    [ 31: 0] read_temp;
  wire             read_valid;
  wire    [ 31: 0] rmw_temp;
  wire    [ 24: 0] test_addr;
  wire    [ 23: 0] txt_code;
  wire             we_n;
  wire    [ 31: 0] zs_dq;
initial
  begin
    $write("\n");
    $write("************************************************************\n");
    $write("This testbench includes an SOPC Builder Generated Altera model:\n");
    $write("'sdram_sdram_controller_test_component.v', to simulate accesses to SDRAM.\n");
    $write("Initial contents are loaded from the file: 'sdram_sdram_controller_test_component.dat'.\n");
    $write("************************************************************\n");
  end
  //Synchronous write when (CODE == 24'h205752 (write))
  sdram_sdram_controller_test_component_ram_module sdram_sdram_controller_test_component_ram
    (
      .data      (rmw_temp),
      .q         (read_data),
      .rdaddress ((CODE == 24'h205752) ? test_addr : read_addr),
      .rdclken   (1'b1),
      .wraddress (test_addr),
      .wrclock   (clk),
      .wren      (CODE == 24'h205752)
    );

  assign cke = zs_cke;
  assign cs_n = zs_cs_n;
  assign ras_n = zs_ras_n;
  assign cas_n = zs_cas_n;
  assign we_n = zs_we_n;
  assign dqm = zs_dqm;
  assign ba = zs_ba;
  assign a = zs_addr;
  assign cmd_code = {ras_n, cas_n, we_n};
  assign CODE = (&cs_n) ? 24'h494e48 : txt_code;
  assign addr_col = a[9 : 0];
  assign test_addr = {addr_crb, addr_col};
  assign mem_bytes = read_data;
  assign rmw_temp[7 : 0] = dqm[0] ? mem_bytes[7 : 0] : zs_dq[7 : 0];
  assign rmw_temp[15 : 8] = dqm[1] ? mem_bytes[15 : 8] : zs_dq[15 : 8];
  assign rmw_temp[23 : 16] = dqm[2] ? mem_bytes[23 : 16] : zs_dq[23 : 16];
  assign rmw_temp[31 : 24] = dqm[3] ? mem_bytes[31 : 24] : zs_dq[31 : 24];
  // Handle Input.
  always @(posedge clk)
    begin
      // No Activity of Clock Disabled
      if (cke)
        begin
          // LMR: Get CAS_Latency.
          if (CODE == 24'h4c4d52)
              latency <= a[6 : 4];
          // ACT: Get Row/Bank Address.
          if (CODE == 24'h414354)
              addr_crb <= {ba[1], a, ba[0]};
          rd_valid_pipe[2] <= rd_valid_pipe[1];
          rd_valid_pipe[1] <= rd_valid_pipe[0];
          rd_valid_pipe[0] <= CODE == 24'h205244;
          rd_addr_pipe_2 <= rd_addr_pipe_1;
          rd_addr_pipe_1 <= rd_addr_pipe_0;
          rd_addr_pipe_0 <= test_addr;
          rd_mask_pipe_2 <= rd_mask_pipe_1;
          rd_mask_pipe_1 <= rd_mask_pipe_0;
          rd_mask_pipe_0 <= dqm;
        end
    end


  assign read_temp[7 : 0] = mask[0] ? 8'bz : read_data[7 : 0];
  assign read_temp[15 : 8] = mask[1] ? 8'bz : read_data[15 : 8];
  assign read_temp[23 : 16] = mask[2] ? 8'bz : read_data[23 : 16];
  assign read_temp[31 : 24] = mask[3] ? 8'bz : read_data[31 : 24];
  //use index to select which pipeline stage drives addr
  assign read_addr = (index == 0)? rd_addr_pipe_0 :
    (index == 1)? rd_addr_pipe_1 :
    rd_addr_pipe_2;

  //use index to select which pipeline stage drives mask
  assign read_mask = (index == 0)? rd_mask_pipe_0 :
    (index == 1)? rd_mask_pipe_1 :
    rd_mask_pipe_2;

  //use index to select which pipeline stage drives valid
  assign read_valid = (index == 0)? rd_valid_pipe[0] :
    (index == 1)? rd_valid_pipe[1] :
    rd_valid_pipe[2];

  assign index = latency - 1'b1;
  assign mask = read_mask;
  assign zs_dq = read_valid ? read_temp : {32{1'bz}};

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  assign txt_code = (cmd_code == 3'h0)? 24'h4c4d52 :
    (cmd_code == 3'h1)? 24'h415246 :
    (cmd_code == 3'h2)? 24'h505245 :
    (cmd_code == 3'h3)? 24'h414354 :
    (cmd_code == 3'h4)? 24'h205752 :
    (cmd_code == 3'h5)? 24'h205244 :
    (cmd_code == 3'h6)? 24'h425354 :
    (cmd_code == 3'h7)? 24'h4e4f50 :
    24'h424144;


//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on




endmodule




