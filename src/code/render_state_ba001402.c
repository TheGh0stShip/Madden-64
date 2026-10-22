#include "types.h"
extern u32* D_80084F5C; extern u32 D_80088798;
void func_8000A3C0(u32 value) { u32* state=&D_80088798; if (*state!=value) { u32* command=D_80084F5C; D_80084F5C=command+2; command[0]=0xBA001402; command[1]=value; *state=value; } }
