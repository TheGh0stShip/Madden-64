#include "types.h"

typedef struct {
    u8 pad00[0x21];
    u8 flags21;
    u8 pad22[2];
    s32 unk24;
    u16 flags28;
} Object;

extern s32 D_80080C10;
extern s32 D_80086CE8;
extern s16 D_80088AE4;
extern s32 D_80089490[];
extern u8 D_8008951A;
extern s16 D_80089598[];
extern u8 D_8008AFC6;

void func_800BFF9C(Object *, u16);
void func_800A2E4C(s32 *, s32);

void func_800C54F8(Object *obj) {
    s32 *p = D_80089490;
    s32 id;

    if ((D_8008AFC6 == 0 || D_8008951A == 0 || (D_80080C10 & 0x800001)) && (D_80080C10 & 2) &&
        (obj->flags28 & 8) && (obj->flags21 & 0xC0) != 0x40 && *p != -1) {
        do {
            id = *p++;
            if (D_80089598[id] == D_80088AE4) {
                func_800BFF9C(obj, id);
                if (D_8008AFC6 != 0) {
                    func_800A2E4C(&D_80086CE8, obj->unk24);
                }
                return;
            }
        } while (*p != -1);
    }
}
