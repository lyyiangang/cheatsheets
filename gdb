# you need build cpp code with 'g++ main.c -o a.out -std=c++11 -g -O0'
# ref:https://hikoqiu.github.io/posts/zh/2017/07/GDBchangyongmingling_tech.html
# To start the debugger:
gdb <executable>, gdb --args <executable> [<args>...], gdb -p <pid>

# call a function, you can add a break poing in all_func and then use command call
call add_func(3, 4)

# To exit gdb (after program terminated):
q, quit

# To set a breakpoint at a function:
b, break <function>

# To set a (conditional) breakpoint at a general location:
b, break <loc> [if <condition>]
  with <loc> as <function>|<file>:<line>|<line>|*<address>|-offset|+offset
#e.g.
b src/test.cc:52 if aa==true


# print loop. print array's fields
set idx=0
p persons[idx++].age
//then press enter, it will print persons[0].age, persons[1].age,...

# print loop way 2. e.g. person.size == 20
set $idx=0
while ($idx < 20)
p persons[$idx++].age
end

# To set a watchpoint, i.e., stop when expression changes its value:
watch <expr>
e.g. watch idx==10, break when idx == 10.

# To show all breakpoints and watchpoints:
info breakpoints, info watchpoints

# To delete all or given breakpoints and watchpoints.  del all breakpoints, just use 'd'
clear, delete
delete <num>
clear <loc>
  with <loc> as <function>|<file>:<line>|<line>|*<address>|-offset|+offset


# To disable a breakpoint:
dis, disable <num>

# To run the program, optionally with arguments for the program:
r, run [<args>]

# To run the current line, stepping over any invocations:
n, next

# To run the current line, stepping into any invocations:
s, step

# To run until the next line below, i.e., without new loop iteration:
u, until

# Like run, but stop at the first machine instruction:
starti

# To step or go to next line by a machine instruction
si, stepi
ni, nexti

# To run until given location is reached
advance <loc>
  with <loc> as <function>|<file>:<line>|<line>|*<address>|-offset|+offset

# To run until function ends, i.e., jump out of a function:
fin, finish

# To continue execution:
c, continue

# To print a stacktrace, optionally with local variables:
bt, backtrace [full]

# Move to stack frame of given number or a frame up or down:
frame <num>, up, down

# To show summary info on selected frame:
info frame

# To print the arguments or local variables to the current function:
info args, info locals

# To print the registers:
info registers

# To print a list of all the threads:
info threads

# To print a list of all the loaded shared libraries:
info sharedlibrary

# To evaluate an expression and print the result:
p length=strlen(string)

# To print an array of given length:
p *<array>@<len>

# Examine content at address with a format and letter size:
x/<count><fmt><size> <address>
    ------- <fmt> ------    ------- <size> -------
    a | Address             b | 8 bits  - byte
    i | Instruction         h | 16 bits - halfword
    t | Binary              w | 32 bits - word
    o | Octal               g | 64 bits - giant
    h | Hex
    z | Hex, zero padded
    d | Decimal
    u | Unsigned decimal
    f | Float
    c | Char
    s | String

# To list surrounding source code:
l, list

# Disassemble the current or given function:
disas, disassemble [/m] [<func>]
  with /m to show mixed source

# Disassemble the given address range:
disas <start>,<end>
disas <start>,+<length>

# To specify a given register, program counter, frame pointer, stack pointer
$reg, $pc, $fp, $sp

# To enable pretty print of arrays and more:
set pretty print on

# To toggle TUI mode:
C-x C-a, C-x a, C-x A

# To use a TUI layout with only one window:
C-x 1

# To use a TUI layout with two windows:
C-x 2

# To change active window:
C-x o

# To Switch in and out of the TUI SingleKey mode:
C-x s

# print all items
set print repeats 0

# print eigen
p *mat.row(2).data()@30
p *mat.data()@100

# add tempory break point, deleted automatically when reach
tbreak 522

# ignore breakpoint #3 20 times
ignore 3 20
# then check how many times #3 hit.
info b 3
