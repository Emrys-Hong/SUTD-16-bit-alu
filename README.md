# 16-bit-alu
A 16 bit adder using lucid language programming on FPGA, can achieve alu functions and auto testing

on the IO shield

io_dip:

left most is [2][7,6] or [7-:2] is set state:

if == 01 -> get first input (input1) -> press center button (io_button[1]) to store 

use seqeuential logic to store

dff.d = dff.q + input1 (for every button press, cannot press more than one time)

if == 10 -> get second input

input2 goes into another dff (same principal)

if == 11 -> execute operation (get result)

dff: add result to another dff

seperate Alu module 

in the always loop:

Alu.input1 = dff1.q
Alu.input2 = dff2.q

dffAlu.d = dffAlu.q + result

state4 -> auto testing (automated test cases to run)

using FSM

case add -> case sub -> case mult -> etc.

if fail -> error case

error module



