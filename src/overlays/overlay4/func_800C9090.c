#include "types.h"

typedef struct {
    u8 pad0[0x1C];
    s32 unk1C;
    s32 unk20;
} S6178;

typedef struct {
    u8 unk0;
    u8 unk1;
    s16 unk2;
    s16 unk4;
} S7AB0;

extern void func_8004192C(s32);
extern void func_80041E54(s32);
extern void func_800A365C(s32);
extern void func_800ABCA0(s32, s32);
extern void func_800C1368(void);
extern void func_800C5F80(void);
extern S6178 *D_80086178;
extern S7AB0 D_80087AB0;
extern s16 D_80088AE4;
extern s32 D_8008A3DC;
extern s16 D_8008A5B2;

void func_800C9090(void) {
    s32 second;
    u16 byte_value;

    D_8008A5B2 = 6;
    D_8008A3DC = 0;
    func_800C1368();
    D_80087AB0.unk0 = 0x13;
    D_80087AB0.unk2 = D_80086178->unk1C >> 16;
    do {
        byte_value = D_80088AE4;
        second = D_80086178->unk20 >> 16;
        D_80087AB0.unk1 = byte_value;
        D_80087AB0.unk4 = second;
    } while (0);
    func_800C5F80();
    if (D_80088AE4 != 0) {
        func_80041E54(0xC);
    } else {
        func_8004192C(1);
    }
    func_800A365C(1);
    func_800ABCA0(1, 0xF0);
}
