module ClockDivider (
    input wire clk_in,
    input wire reset,
    output reg clk_out
);
    reg [24:0] counter;

    always @(posedge clk_in or posedge reset) begin
        if (reset) begin
            counter <= 0;
            clk_out <= 0;
        end else begin
            if (counter == 25_000_000 - 1) begin 
                counter <= 0;
                clk_out <= ~clk_out;
            end else begin
                counter <= counter + 1;
            end
        end
    end
endmodule

module jkFlipFlop (
    input wire j, 
    input wire k, 
    input wire clk, 
    input wire reset,
    output reg q0, 
    output wire q1
);

always @(posedge clk or posedge reset) begin
    if (reset)
        q0 <= 0;
    else begin
        case ({j, k})
            2'b00: q0 <= q0;
            2'b01: q0 <= 1'b0;
            2'b10: q0 <= 1'b1;
            2'b11: q0 <= ~q0;
        endcase
    end
end

assign q1 = ~q0;

endmodule

module InputFlipFlop (
    input wire clk,
    input wire reset,
    input wire X1, X2,
    output wire Q1, Q2, Q3, Q4
);

wire J1, K1, J2, K2, J3, K3, J4, K4;

// Logic for JK inputs
assign J1 = (Q3 & X2) | (Q2 & ~Q3 & X1) | (Q2 & Q4 & X1) | (~Q3 & Q4 & X1) | (~Q2 & ~Q4 & X2);
assign K1 = (Q2 & ~X1 & ~X2) | (Q3 & Q4 & ~X1 & ~X2);
assign J2 = (~Q4 & X2) | (~Q1 & Q4 & X1) | (~Q3 & Q4 & X1) | (~Q1 & Q3 & X2);
assign K2 = (Q1 & ~X1 & ~X2) | (Q3 & Q4 & ~X1 & X2);
assign J3 = Q4 & ~X1 & X2;
assign K3 = (~Q1 & X2) | (~Q4 & X2) | (~Q1 & Q4 & X1) | (Q1 & Q4 & ~X1 & ~X2);
assign J4 = (~Q2 & X1 & ~X2) | (Q3 & X1 & ~X2) | (~Q1 & Q2 & ~Q3 & ~X1 & X2);
assign K4 = (~Q1 & X1) | (~Q3 & X1) | (Q1 & Q3 & ~X1 & ~X2) | (~Q1 & Q4 & X2) | (~Q3 & Q4 & X2);

// Instantiate JK flip-flops
jkFlipFlop jk1 (
    .j(J1),
    .k(K1),
    .clk(clk),
    .reset(reset),
    .q0(Q1),
    .q1()
);

jkFlipFlop jk2 (
    .j(J2),
    .k(K2),
    .clk(clk),
    .reset(reset),
    .q0(Q2),
    .q1()
);

jkFlipFlop jk3 (
    .j(J3),
    .k(K3),
    .clk(clk),
    .reset(reset),
    .q0(Q3),
    .q1()
);

jkFlipFlop jk4 (
    .j(J4),
    .k(K4),
    .clk(clk),
    .reset(reset),
    .q0(Q4),
    .q1()
);

endmodule

module OutputFlipFlop (
    input wire Q1, Q2, Q3, Q4,
    output wire Z1, Z2, Z3, Z4, Z5, Z6, Z7, Z8, Z9, Z10, Z11, Z12
);

assign Z1 = Q3 | Q4 | (~Q1 & Q2) | (Q1 & ~Q2);
assign Z2 = Q3 | (~Q1 & Q2) | (Q1 & ~Q2);
assign Z3 = (~Q1 & Q2) | (Q1 & ~Q2) | (Q3 & Q4);
assign Z4 = (~Q1 & Q2) | (Q1 & ~Q2);
assign Z5 = (Q1 & ~Q2) | (Q2 & Q4) | (Q2 & Q3);
assign Z6 = (Q1 & ~Q2) | (Q2 & Q3);
assign Z7 = (Q1 & ~Q2) | (Q2 & Q3 & Q4);
assign Z8 = Q1 & ~Q2;
assign Z9 = (Q1 & Q4) | (Q1 & Q3);
assign Z10 = Q1 & Q3;
assign Z11 = Q1 & Q3 & Q4;
assign Z12 = Q1 & Q2;

endmodule

module TopModule (
    input wire clk,
    input wire reset,
    input wire X1, X2,
    output wire Z1, Z2, Z3, Z4, Z5, Z6, Z7, Z8, Z9, Z10, Z11, Z12, c1
);

wire Q1, Q2, Q3, Q4;
wire slow_clk;

// Instantiate clock divider module
ClockDivider clk_div (
    .clk_in(clk),
    .reset(reset),
    .clk_out(slow_clk)
);

// Show the slow clock on the board
assign c1 = slow_clk;

// Instantiate input flip-flop module
InputFlipFlop inputFF (
    .clk(slow_clk),
    .reset(reset),
    .X1(X1),
    .X2(X2),
    .Q1(Q1),
    .Q2(Q2),
    .Q3(Q3),
    .Q4(Q4)
);

// Instantiate output flip-flop module
OutputFlipFlop outputFF (
    .Q1(Q1),
    .Q2(Q2),
    .Q3(Q3),
    .Q4(Q4),
    .Z1(Z1),
    .Z2(Z2),
    .Z3(Z3),
    .Z4(Z4),
    .Z5(Z5),
    .Z6(Z6),
    .Z7(Z7),
    .Z8(Z8),
    .Z9(Z9),
    .Z10(Z10),
    .Z11(Z11),
    .Z12(Z12)
);

endmodule
