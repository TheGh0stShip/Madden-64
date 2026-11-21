#include "types.h"

extern s16 D_800740CA;
typedef struct { u8 v; u8 pad[0x27]; } Sub;
typedef struct { Sub sub[213]; u8 pad[4]; } Rec;
extern Rec D_80080D89[];
extern u8 D_800740BC[];
typedef struct {
    u8 lo;
    u8 hi;
    u8 pad[2];
} Range;

extern Range D_800740A4[];
extern s16 func_8003FE94(u16 value);
extern u16 func_80031A1C(s32 value);
extern void func_8003F060(s32 first, s32 second, s32 third);
extern void func_80022738(s32 first, s32 second);

s32 audio_sequence_prepare(s32 arg0, s32 arg1) {
    s16 id = arg0;
    u16 b = arg1;
    s16 v;
    s16 i;

    if (D_800740CA == 0) {
        return 0;
    }
    if (func_8003FE94((u16)id) == -1) {
        return 0;
    }
    v = D_80080D89[id].sub[b].v;
    if (v == 0xFF) {
        return 0;
    }
    v = -v;
    v += func_80031A1C(300) + 200;
    if ((u16)func_80031A1C((u16)v) < 325) {
        return 0;
    }
    v = func_80031A1C(99);
    i = 6;
    while ((s16)v >= 0) {
        i--;
        v -= D_800740BC[(s16)i];
    }
    v = i;
    func_8003F060((s16)id, b,
                  (u16)(D_800740A4[v].lo + func_80031A1C((u16)(D_800740A4[v].hi - D_800740A4[v].lo))));
    func_80022738((u16)id, b);
    return 1;
}
