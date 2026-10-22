#include "types.h"
extern u32* D_80084F5C; extern u32 D_800887F4;
void func_8000A8FC(u32 value) { u32* state=&D_800887F4; if (*state!=value) { u32* command=D_80084F5C; D_80084F5C=command+2; command[0]=0xBA001001; command[1]=value; *state=value; } }
