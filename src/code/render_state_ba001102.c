#include "types.h"
extern u32* D_80084F5C; extern u32 D_800887EC;
void func_8000A874(u32 value) { u32* state=&D_800887EC; if (*state!=value) { u32* command=D_80084F5C; D_80084F5C=command+2; command[0]=0xBA001102; command[1]=value; *state=value; } }
