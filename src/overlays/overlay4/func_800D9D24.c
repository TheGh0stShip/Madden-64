#include "types.h"

typedef struct { u8 pad[0x1C]; s32 unk1C; u8 pad20[0xC]; s32 unk2C; } Pos800D9D24;
typedef struct Obj800D9D24 { u8 pad[0x24]; Pos800D9D24 *unk24; u16 unk28; } Obj800D9D24;
extern void func_800C0018(Obj800D9D24 *, s32, s32);
extern void func_800E1C98(void);
extern s16 D_800894FC;
extern Obj800D9D24 *D_8008A058;

s32 func_800D9D24(Obj800D9D24 *arg0) {
    Pos800D9D24 *p;

    if (!(arg0->unk28 & 1)) {
        if (D_800894FC != 0) {
            func_800E1C98();
            return 1;
        }
        if (D_8008A058) {
            p = D_8008A058->unk24;
            if (p->unk2C >= 0) {
                if (p->unk2C != 0 && p->unk1C >= arg0->unk24->unk1C) {
                    func_800C0018(arg0, 0x400, 0);
                }
            } else if (p->unk1C < arg0->unk24->unk1C) {
                func_800C0018(arg0, 0xC00, 0);
            }
        }
    }
    return 0;
}
