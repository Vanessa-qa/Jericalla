module ROM
(
	input wire [3:0] address01,
	input wire [3:0] address02,
	output [31:0] data_01,
	output [31:0] data_02
);

reg [3:0] rom [0:15];

initial
	begin
		#100;
		$readmemb ("datos.txt", rom);
	end
	
always @*
begin 
	rom[address01] = data_01;
	rom[address02] = data_02;
end

endmodule
