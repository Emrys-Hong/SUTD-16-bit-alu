# 16-bit-alu

16-bit 2-input ALU using the Lucid programming language on the Mojo v3 FPGA development board (Spartan 6).

## ALU Functionality

### Core ALU Functionality

* Addtion/Subtraction
* Boolean (AND, OR, XOR)
* Shift Left/Right (with optional sign extension)
* Comparison (equal, less than, or both)
* Multiplication and Division

### Additional Functionality

* Auto Testing
* Ability to check for overflow for the Adder module: if an error is detected, it will be displayed
* Ability to do `C1*INPUT_1 OP C2*INPUT_2`, where `C1` and `C2` are constants, and `OP` is the operation on the two operands `INPUT_1` and `INPUT_2`.

## Using the ALU on Mojo v3 with IO Shield

The ALU/Mojo will have a series of four primary states

State | `io_dip[2][7:6]` | Purpose/Function
------|----------------|------------------
1 | `[0][1]` | Press `io_button[1]` -> `store io_dip[1:0]` into `input_1`
2 | `[1][0]` | Press `io_button[1]` -> `store io_dip[1:0]` into `input_2`
3 | `[1][1]` | Display result from ALU on `io_led`, depending on `io_dip[2][5,0]` as `ALUFN`
4 | `[0][0]` | Automated testing state (running test cases)

* `io_button[1]` is the center button on the 5-button pad on the Mojo v3 IO Shield
* `io_dip[2][7:6]` are the two leftmost dip switches on the Mojo v3 IO Shield

## Other technical details

#### Seqeuential logic is used to store the inputs

`dff1.d = dff1.q + input1`

For every button press, if you press more than one time, you increment a constant `C1` or `C2` (see "Additional Functionality" above)

#### Alu module 

In the always loop:

```
Alu.input1 = dff1.q
Alu.input2 = dff2.q

dffAlu.d = dffAlu.q + Alu.output
```

#### Automated Testing module

This module uses a Finite State Machine (FSM) to iterate through a series of test cases for the variations operations the ALU should be capable of performing, testing some postive, negative, mixed and boundary cases.

```
case_add -> case_sub -> case_mult -> case_etc

if fail -> error_case

After all 16 test cases pass -> pass_case; display GOOD
```

## Team

* Hong Peng Fei
* Khong Jia Wei
* Faith See
* Timothy Liu

