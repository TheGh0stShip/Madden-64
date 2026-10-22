#include "types.h"
extern u32* D_80084F5C; extern u32 D_800887FC;
void func_8000A984(u32 value) { u32* state=&D_800887FC; if (*state!=value) { u32* command=D_80084F5C; D_80084F5C=command+2; command[0]=0xBA001301; command[1]=value; *state=value; } }
