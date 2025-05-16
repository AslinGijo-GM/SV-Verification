// module fulladder(
// 	input a,b,c,
//     output sum,carry
// );
  
//   assign sum = a^b^c;
//   assign carry = (a&b)|(b&c)|(a&c);
  
// endmodule



module fulladder(
	intf intff
);
  
  assign intff.sum = intff.a^intff.b^intff.c;
  assign intff.carry = (intff.a&intff.b)|(intff.b&intff.c)|(intff.a&intff.c);
  
endmodule





// https://edaplayground.com/x/LKGu

// https://edaplayground.com/x/twNY  //  with coverage //
