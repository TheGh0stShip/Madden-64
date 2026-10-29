#include "types.h"

typedef struct { u8 pad[0x24]; s32 unk24; } S6178;
extern S6178 *D_80086178;
extern u16 D_8008A5B2;
extern s32 D_80087A70;
extern void func_800C1368(void);

void func_800C9F78(void) {
    if (D_80086178->unk24 == 0 && D_8008A5B2 == 4) {
        func_800C1368();
        D_80087A70 = 0x7FFFFFFF;
    }
}
