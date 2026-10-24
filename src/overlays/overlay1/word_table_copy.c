#include "types.h"

extern u32 D_8007A0BC[];
extern u32 D_8006B840[];

void func_800AD700(u16 index) {
    D_8006B840[index] = D_8007A0BC[index];
}
