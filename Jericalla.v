module Jericalla
(
	input [16:0] instruction,
	output [31:0] data_out
);
	
	//Cables
	//Entrada de la RAM
	wire [3:0] dirRAM;
	//Conexión entre la ALU - RAM
	wire [31:0] data_ram;
	//Selector de opcion de la ALU
	wire [3:0] OPcode;
	//Entradas de la ROM
	wire [3:0] dir1;
	wire [3:0] dir2;
	//Conexiones interanas entre ROM - ALU
	wire [31:0] data1_rom;
	wire [31:0] data2_rom;
	//Habilitar la escritura en la RAM
	wire EN;
	
	//Asignaciones
	assign dirRAM = instruction[16:13];
	assign OPcode = instruction[12:9];
	assign dir1 = instruction[8:5];
	assign dir2 = instruction[4:1];
	assign EN = instruction[0];
	
	//Instancia de los modulos
	//Modulo ROM
	ROM rom 
	(
		.address01(dir1), 
		.address02(dir2),
		.data_01(data1_rom),
		.data_02(data2_rom)
	);
	//Modulo ALU
	ALU alu
	(
		.A(data1_rom),
		.B(data2_rom),
		.OP(OPcode),
		.R(data_ram)
	);
	//Modulo RAM
	RAM ram
	(
		.address(dirRAM),
		.data_in(data_ram),
		.write_enable(EN),
		.data_out(data_out)
	);
	
endmodule