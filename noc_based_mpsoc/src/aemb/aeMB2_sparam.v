/* $Id: aeMB2_sparam.v,v 1.2 2008-04-26 01:09:06 sybreon Exp $
** 
** AEMB2 EDK 6.2 COMPATIBLE CORE
** Copyright (C) 2004-2008 Shawn Tan <shawn.tan@aeste.net>
** 
** This file is part of AEMB.
**
** AEMB is free software: you can redistribute it and/or modify it
** under the terms of the GNU Lesser General Public License as
** published by the Free Software Foundation, either version 3 of the
** License, or (at your option) any later version.
**
** AEMB is distributed in the hope that it will be useful, but WITHOUT
** ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
** or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General
** Public License for more details.
**
** You should have received a copy of the GNU Lesser General Public
** License along with AEMB. If not, see <http:**www.gnu.org/licenses/>.
*/
/**
 * @file aeMB2_sparam.v
 * @brief On-chip single-port asynchronous SRAM.

 * This will be implemented as distributed RAM.
  
 */
`timescale  1ns/1ps
module aeMB2_sparam (/*AUTOARG*/
   // Outputs
   dat_o,
   // Inputs
   adr_i, dat_i, wre_i, clk_i, ena_i
   ) ;
   parameter AW = 5; // 32
   parameter DW = 2; // x2

   // PORT A - READ/WRITE
   output [DW-1:0] dat_o;  
   input [AW-1:0]  adr_i;
   input [DW-1:0]  dat_i;
   input 	   wre_i;
   
   // SYSCON
   input 	   clk_i, ena_i;

   /*AUTOREG*/
   
   reg [DW-1:0]    rRAM [(1<<AW)-1:0];
   reg [AW-1:0]    rADDR;
   
   always @(posedge clk_i)
     begin
	if (wre_i) 
	  rRAM[adr_i] <= #1 dat_i;	
     end
   
   assign 	   dat_o = rRAM[adr_i];
   
   // --- SIMULATION ONLY ------------------------------------
   // synopsys translate_off
   integer i;
   initial begin
      for (i=0; i<(1<<AW); i=i+1) begin
	 rRAM[i] <= {(DW){1'b0}};	 
end
   end
   // synopsys translate_on
   
endmodule // aeMB2_sparam

/*
 $Log: not supported by cvs2svn $
 Revision 1.1  2008/04/20 16:33:39  sybreon
 Initial import.
*/