#include "types.h"

typedef struct {
    u8 id;
    u8 pad[12];
} Entry;

extern s16 D_8006B9E0;
extern s16 D_8006B9E4[];
extern s16 D_80086190[];
extern s8 D_800C4EEB;
extern Entry D_800C4EF8[];

void func_8009F60C(void) {
    s8 *count = &D_800C4EEB;
    u32 i;

    for (i = 0; i < (u16)*count; i++) {
        D_8006B9E4[i] = D_80086190[i] = D_800C4EF8[i].id;
    }
    D_8006B9E0 = D_800C4EEB;
}
