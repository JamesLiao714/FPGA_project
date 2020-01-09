module NesController(
	input pixelClock,
	input vSyncStart,
	input button0,							// down
	input button1,							// reset
	input button2,							// up
	output reg [7:0] buttons
);

parameter
	buttonA = 8'd0,
	buttonB = 8'd1,
	buttonSelect = 8'd2,
	buttonStart = 8'd3,
	buttonUp = 8'd4,
	buttonDown = 8'd5,
	buttonLeft = 8'd6,
	buttonRight = 8'd7;

always @(posedge pixelClock)
begin
	if (button0 == 0)
		buttons[buttonDown] <= 1;
	else
		buttons[buttonDown] <= 0;
	if (button1 == 0)
		begin
			buttons[buttonA] <= 1;
			buttons[buttonStart] <= 1;
		end
	else
		begin
			buttons[buttonA] <= 0;	
			buttons[buttonStart] <= 0;
		end
	if (button2 == 0)
		buttons[buttonUp] <= 1;
	else
		buttons[buttonUp] <= 0;
end

endmodule
