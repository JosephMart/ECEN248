`timescale 1ns / 1ps
/*this module generates the interface signal necessary to*
 *communicate with the character LCD on the Spartan 3e   *
 *This code was modified from earlier semesters of 248   */

module lcd_driver_lab11_ver1(Clk, Rst, highwaySignal, farmSignal, SF_D, LCD_E, LCD_RS, LCD_RW);
input [1:0] highwaySignal; //status of highway signal light
input [1:0] farmSignal; //status of farm road signal light
input Clk, Rst;

/*needed at end of code to construct display output*/
reg [47:0] highway_ascii; //6 characters for highway status
reg [47:0] farm_ascii; //6 characters for farm road status

/*This is shitty code but I don't have time to fix it right now....*/
output [3:0] SF_D;
reg [3:0] SF_D=4'd0;
output LCD_E, LCD_RS, LCD_RW;
reg LCD_E=1'b0;
reg LCD_RS=1'b0;
reg LCD_RW=1'b0;
reg [20:0] count=21'd0;
reg [7:0] d=8'd0;
wire [255:0] display_data;

//Sequential Logic to generate Timing
always @ (posedge Clk)
begin
case (Rst)
1'b1:
begin	
	count <= count + 21'd1;
	if ((count == 21'd750000) && (d==8'd0))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0011;
		LCD_E <= 1'b1;
	end
	if ((count == 21'd20) && (d==8'd1))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd205000) && (d==8'd2))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0011;
		LCD_E <= 1'b1;
	end
	if ((count == 21'd20) && (d==8'd3))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd5000) &&(d==8'd4))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0011;
		LCD_E <= 1'b1;
	end
	if ((count == 21'd20) && (d==8'd5))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd2200) && (d==8'd6))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0010;
		LCD_E <= 1'b1;
	end
	if ((count == 21'd20) && (d==8'd7))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//DISPLAY CONFIG
	//Function Set Command
	if ((count == 21'd2200) && (d==8'd8))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0010;
		LCD_E <= 1'b1;
	end
	if ((count == 21'd20) && (d==8'd9))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd10))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b1000;
		LCD_E <= 1'b1;
	end
	if ((count == 21'd20) && (d==8'd11))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Entry Mode Set Command 
	if ((count == 21'd2200) && (d==8'd12))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b1;
	end
	if ((count == 21'd20) && (d==8'd13))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd14))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0110;
		LCD_E <= 1'b1;
	end
	if ((count == 21'd20) && (d==8'd15))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Display ON/OFF command
	if ((count == 21'd2200) && (d==8'd16))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b1;
	end
	if ((count == 21'd20) && (d==8'd17))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd18))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b1111;
		LCD_E <= 1'b1;
	end
	if ((count == 21'd20) && (d==8'd19))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Clear Display
	if ((count == 21'd2200) && (d==8'd20))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b1;
	end
	if ((count == 21'd20) && (d==8'd21))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd22))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0001;
		LCD_E <= 1'b1;
	end
	if ((count == 21'd20) && (d==8'd23))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd80000) && (d==8'd24))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
end

1'b0:
begin
	count <= count + 21'd1;
	//Write Address and Data
	//Write Initial Address
	if ((count == 21'd2000) && (d==8'd25))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b1000;
		LCD_E <= 1'b1;
		LCD_RS <= 1'b0;
		LCD_RW <=1'b0;
	end
	if ((count == 21'd20) && (d==8'd26))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
		LCD_RS <= 1'b0;
		LCD_RW <=1'b0;
	end
	if ((count == 21'd60) && (d==8'd27))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b1;
		LCD_RS <= 1'b0;
		LCD_RW <=1'b0;
	end
	if ((count == 21'd20) && (d==8'd28))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Write Data=1 on each first space
	if ((count == 21'd2200) && (d==8'd29))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[255:252];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd30))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd31))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[251:248];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd32))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=2
	if ((count == 21'd2200) && (d==8'd33))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[247:244];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd34))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd35))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[243:240];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd36))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=3
	if ((count == 21'd2200) && (d==8'd37))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[239:236];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd38))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd39))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[235:232];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd40))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=4
	if ((count == 21'd2200) && (d==8'd41))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[231:228];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd42))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd43))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[227:224];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd44))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=5
	if ((count == 21'd2200) && (d==8'd45))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[223:220];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd46))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd47))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[219:216];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd48))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=6
	if ((count == 21'd2200) && (d==8'd49))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[215:212];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd50))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd51))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[211:208];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd52))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=7
	if ((count == 21'd2200) && (d==8'd53))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[207:204];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd54))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd55))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[203:200];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd56))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=8
	if ((count == 21'd2200) && (d==8'd57))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[199:196];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd58))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd59))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[195:192];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd60))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=9
	if ((count == 21'd2200) && (d==8'd61))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[191:188];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd62))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd63))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[187:184];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd64))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=10
	if ((count == 21'd2200) && (d==8'd65))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[183:180];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd66))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd67))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[179:176];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd68))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=11
	if ((count == 21'd2200) && (d==8'd69))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[175:172];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd70))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd71))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[171:168];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd72))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=12
	if ((count == 21'd2200) && (d==8'd73))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[167:164];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd74))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd75))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[163:160];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd76))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=13
	if ((count == 21'd2200) && (d==8'd77))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[159:156];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd78))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd79))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[155:152];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd80))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=14
	if ((count == 21'd2200) && (d==8'd81))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[151:148];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd82))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd83))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[147:144];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd84))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=15
	if ((count == 21'd2200) && (d==8'd85))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[143:140];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd86))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd87))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[139:136];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd88))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=16
	if ((count == 21'd2200) && (d==8'd89))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[135:132];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd90))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd91))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[131:128];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd92))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Write 2nd Line Initial Address
	if ((count == 21'd2000) && (d==8'd93))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b1100;
		LCD_E <= 1'b1;
		LCD_RS <= 1'b0;
		LCD_RW <=1'b0;
	end
	if ((count == 21'd20) && (d==8'd94))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd95))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b1;
		LCD_RS <= 1'b0;
		LCD_RW <=1'b0;
	end
	if ((count == 21'd20) && (d==8'd96))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	///Data=17
	if ((count == 21'd2200) && (d==8'd97))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[127:124];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd98))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd99))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[123:120];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd100))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=18
	if ((count == 21'd2200) && (d==8'd101))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[119:116];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd102))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd103))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[115:112];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd104))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=19
	if ((count == 21'd2200) && (d==8'd105))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[111:108];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd106))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd107))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[107:104];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd108))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=20
	if ((count == 21'd2200) && (d==8'd109))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[103:100];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd110))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd111))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[99:96];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd112))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=21
	if ((count == 21'd2200) && (d==8'd113))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[95:92];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd114))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd115))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[91:88];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd116))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=22
	if ((count == 21'd2200) && (d==8'd117))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[87:84];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd118))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd119))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[83:80];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd120))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=23
	if ((count == 21'd2200) && (d==8'd121))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[79:76];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd122))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd123))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[75:72];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd124))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=24
	if ((count == 21'd2200) && (d==8'd125))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[71:68];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd126))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd127))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[67:64];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd128))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=25
	if ((count == 21'd2200) && (d==8'd129))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[63:60];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd130))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd131))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[59:56];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd132))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=26
	if ((count == 21'd2200) && (d==8'd133))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[55:52];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd134))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd135))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[51:48];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd136))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=27
	if ((count == 21'd2200) && (d==8'd137))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[47:44];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd138))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd139))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[43:40];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd140))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=28
	if ((count == 21'd2200) && (d==8'd141))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[39:36];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd142))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd143))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[35:32];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd144))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=29
	if ((count == 21'd2200) && (d==8'd145))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[31:28];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd146))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd147))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[27:24];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd148))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=30
	if ((count == 21'd2200) && (d==8'd149))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[23:20];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd150))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd151))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[19:16];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd152))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=31
	if ((count == 21'd2200) && (d==8'd153))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[15:12];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd154))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd155))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[11:8];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd156))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Data=32
	if ((count == 21'd2200) && (d==8'd157))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[7:4];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;
		
	end
	if ((count == 21'd20) && (d==8'd158))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	if ((count == 21'd60) && (d==8'd159))
	begin
		d <= d + 8'd1;
		count <= 21'd0;
		SF_D <= display_data[3:0];
		LCD_E <= 1'b1;
		LCD_RS <= 1'b1;
		LCD_RW <=1'b0;		
	end
	if ((count == 21'd20) && (d==8'd160))
	begin
		d <= 8'd25;
		count <= 21'd0;
		SF_D <= 4'b0000;
		LCD_E <= 1'b0;
	end
	//Wait for Next Data & Go back to Address Cycle
	//Wait for more than half a second here
	
		
end
endcase
end

/*wow this has to be the worst Verilog code I have ever seen...*/
/*okay my modifications start here... let's see how it goes...*/
/*
 *ASCII cheat sheet:
 * character  Hex Code
 * A          41
 * B          42
 * C          43
 * D          44
 * E          45
 * F          46
 * G          47
 * H          48
 * I          49
 * J          4A
 * K          4B
 * L          4C
 * M          4D
 * N          4E
 * O          4F
 * P          50
 * Q          51
 * R          52
 * S          53
 * T          54
 * U          55
 * V          56
 * W          57
 * X          58
 * Y          59
 * Z          5A
 *SPACE       20
 * |          7C
*/

/*highway_ascii is the ascii representation of the highway signal status */
always@(*)
    case(highwaySignal)
        2'b00: highway_ascii = { 8'h47, 8'h52, 8'h45, 8'h45, 8'h4E, 8'h20}; //green
        2'b01: highway_ascii = { 8'h59, 8'h45, 8'h4C, 8'h4C, 8'h4F, 8'h57}; //yellow
        2'b10: highway_ascii = { 8'h52, 8'h45, 8'h44, 8'h20, 8'h20, 8'h20}; //red
        default: highway_ascii = { 8'h20,  8'h20, 8'h20, 8'h20, 8'h20, 8'h20};//blank
    endcase

/*farm_ascii is the ascii representation of the farm signal status */
always@(*)
    case(farmSignal)
        2'b00: farm_ascii = { 8'h20, 8'h47, 8'h52, 8'h45, 8'h45, 8'h4E}; //green
        2'b01: farm_ascii = { 8'h59, 8'h45, 8'h4C, 8'h4C, 8'h4F, 8'h57}; //yellow
        2'b10: farm_ascii = {8'h20, 8'h20, 8'h20, 8'h52, 8'h45, 8'h44}; //red
        default: farm_ascii = { 8'h20,  8'h20, 8'h20, 8'h20, 8'h20, 8'h20};//blank
    endcase

/*Display data is a 256 bit vector which hold 32 8-bit ascii *
 *characters which are to be displayed on the LCD screen     */
assign display_data = {highway_ascii, 8'h20,{2{8'h7C}}, 8'h20, farm_ascii, {16{8'h20}}};

endmodule
