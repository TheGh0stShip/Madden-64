#include "types.h"

typedef struct Record16 {
    u32 words[4];
} Record16;

extern u16 D_8007A070;
extern u16 D_80087AAC;
extern u16 D_80087AB6;
extern Record16 D_80087AB0;
extern Record16 D_80079530[];

void func_800C7820(void) {
    D_80087AB6 = D_80087AAC;
    D_80079530[D_8007A070] = D_80087AB0;
    D_8007A070++;
}
