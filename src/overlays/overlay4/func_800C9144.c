#include "types.h"

typedef struct { u8 pad0[0x1C]; s32 unk1C; s32 unk20; } SPos;
typedef struct { u8 pad0[0xE]; u8 unkE; u8 padF[0x15]; SPos *unk24; u16 unk28; } SPl;
typedef struct { u8 a; u8 b; } SMsg;
extern s32 func_80031A1C(s32);
extern void func_800E1A84(SPl *, SMsg *);
extern void func_800E1BAC(SPl *, SMsg *);
extern SPl *D_80085040[][22];
extern SPos *D_80086178;
extern s16 D_800886E0;
extern s16 D_80088AE4;

void func_800C9144(void) {
    SMsg msg;
    s32 i;
    SPl *o;
    s32 dx, dy, d;
    msg.a = 0x12;
    for (i = 1; i < 6; i++) {
        o = D_80085040[D_80088AE4][i];
        dx = o->unk24->unk1C - D_80086178->unk1C;
        if (dx < 0) {
            dx = -dx;
        }
        dy = o->unk24->unk20 - D_80086178->unk20;
        if (dy < 0) {
            dy = -dy;
        }
        if (dx < dy) {
            d = dy + dx / 2;
        } else {
            d = dx + dy / 2;
        }
        if (d < 0x500000) {
            if (!(o->unk28 & 0x10)) {
                func_800E1A84(o, &msg);
            } else {
                func_800E1BAC(o, &msg);
            }
        }
    }
    for (i = 0; i < 11; i++) {
        o = D_80085040[D_800886E0][i];
        dx = o->unk24->unk1C - D_80086178->unk1C;
        if (dx < 0) {
            dx = -dx;
        }
        dy = o->unk24->unk20 - D_80086178->unk20;
        if (dy < 0) {
            dy = -dy;
        }
        if (dx < dy) {
            d = dy + dx / 2;
        } else {
            d = dx + dy / 2;
        }
        if (d < 0x500000 && (u16)func_80031A1C(0x136) > 0xFF - o->unkE) {
            if (!(o->unk28 & 0x10)) {
                func_800E1A84(o, &msg);
            } else {
                func_800E1BAC(o, &msg);
            }
        }
    }
}
