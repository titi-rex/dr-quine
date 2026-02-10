# Dr-Quine

## Program

### Colleen

Executable named `Colleen`
Must write his source code to STDIN

Comment example:
```c
/*
  Print his source code
*/
```

**C source code**:
- A main function
- Two comments, one inside main, one outside
- Another function called by main

**ASM source code**:
- Entrypoint (``_start` or `main`)
- Two comments, one inside the entrypoint
- One routine called by entrypoint


### Grace

Executable named `Grace`
Must write in a file named `Grace_kid.{c,s}` his source code

Program without main example:
```c
#include
#define FT(x)int main() {/* code */}
[...]
FT(xxx)
```


**C source code**:
- No main, no function
- Three `#define`
- One comment
- Programm run by calling a macro

**ASM source code**:
- No extra routine beyond the entrypoint needed
- Three macro (or assembler equivalent)
- One comment
 

### Sully

Executable named `Sully`
Must write in a file named `Sully_X.{c,s}` his source code, `X` is an interger given in the source.
Once created, the program compile his file and run the new program.
The programm stop if `X` is less than `0`, ie `Sully_0` create `Sully_-1` but doesn't run it

**C source code**:
- No constraint

**ASM source code**:
- No constraint
