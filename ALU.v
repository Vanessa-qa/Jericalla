`timescale 1ns/1ps
module ALU 
(
	//Entradas
	input [31:0] A,
	input [31:0] B,
	
	//Selector
	input [3:0] OP,
	
	//Salidas
	output reg [31:0] R
);

always @ (OP)
begin
	case (OP)
		//AND
		4'b000 :
		begin
			R = A & B;
		end
		//OR
		4'b0001 :
		begin
			R = A | B;
		end
		//add
		4'b0010 :
		begin
			R = A + B;
		end
		//subtract
		4'b0110 :
		begin
			R = A - B;
		end
		//set on less than
		4'b0111 :
		begin
			R = A < B;
		end
		//NOR
		4'b1100 :
		begin
			R = ~ ( A | B );
		end
	endcase
end

endmodule
