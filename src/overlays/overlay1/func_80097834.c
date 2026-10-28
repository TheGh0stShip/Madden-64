#include "types.h"

typedef struct {
    u8 *obj;
    u8 unk04[0x54];
} TeamEntry;

extern u16 D_80086CA0;
extern u16 D_80086CB0;
extern u16 D_800876E8;
extern TeamEntry D_80085040[];
extern s16 D_80088AE4;

s32 func_80031A1C(s32);
void func_800C0BBC(u8 *, s32);

void func_80097834(void) {
    u8 *obj;

    D_80086CA0--;
    if ((s16)D_80086CA0 < 0) {
        D_80086CA0 = 0;
    }
    D_800876E8++;
    if ((s16)D_800876E8 < 3) {
        D_80086CB0 = D_80086CA0;
    }
    if (D_80085040[D_80088AE4].obj[0x20] == 0 && (u16)func_80031A1C(0xA) < 5) {
        obj = D_80085040[D_80088AE4].obj;
        if (!(*(s32 *)(*(u8 **)(obj + 0x24) + 0x14) & 0x20000)) {
            func_800C0BBC(obj, 0x2A);
        }
    }
}
