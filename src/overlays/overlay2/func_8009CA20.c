#include "types.h"

typedef struct { u8 unk0; u8 unk1; u8 unk2; u8 unk3; u8 unk4; s8 unk5; } Slot;

extern s32 D_800C3A10;
extern s8 D_800C4AD3;
extern s8 D_800C4B3C[];
extern s16 D_800C502C;
extern s32 D_800C504C;
extern void func_800167FC(s16 value, u8 *destination);
void func_8002E65C(char *, char *);
extern u8 *func_8002E688(u8 *destination, const u8 *source);
Slot *func_8009D69C(s32, s32);
char *func_8009D6F0(s32);
s16 func_8009D710(s32);
s16 func_8009D82C(s32);
s16 func_8009D948(s32);

void func_8009CA20(s32 team, u32 kind, u8 *dst) {
    s32 index;
    Slot *slot;

    slot = func_8009D69C(team, index);
    switch (kind) {
    case 0:
        func_8002E65C(dst, func_8009D6F0(slot->unk1));
        if (D_800C4B3C[slot->unk1] == 0) {
            func_8002E688(dst, " (CPU)");
        }
        break;
    case 1:
        func_800167FC(func_8009D710(slot->unk1), dst);
        break;
    case 2:
        func_800167FC(func_8009D82C(slot->unk1), dst);
        break;
    case 3:
        func_800167FC(func_8009D948(slot->unk1), dst);
        break;
    case 4:
        if (slot->unk4 & 0xF) {
            func_800167FC(slot->unk3, dst);
        } else {
            dst[0] = ' ';
            dst[1] = 0;
        }
        break;
    case 5:
        if (slot->unk4 & 0xF) {
            func_800167FC(slot->unk2, dst);
        } else {
            dst[0] = ' ';
            dst[1] = 0;
        }
        break;
    case 6:
        func_8002E65C(dst, func_8009D6F0(slot->unk0));
        if (D_800C4B3C[slot->unk0] == 0) {
            func_8002E688(dst, " (CPU)");
        }
        break;
    case 7:
        func_800167FC(func_8009D710(slot->unk0), dst);
        break;
    case 8:
        func_800167FC(func_8009D82C(slot->unk0), dst);
        break;
    case 9:
        func_800167FC(func_8009D948(slot->unk0), dst);
        break;
    case 10:
        {
            s32 *out = (s32 *)dst;

            if (!(slot->unk4 & 0xF) && D_800C502C == D_800C4AD3) {
                if (slot->unk5 == 0) {
                    *(s32 *)dst = D_800C504C;
                } else {
                    *(s32 *)dst = D_800C3A10;
                }
            } else {
                *out = 0;
            }
        }
        break;
    case 11:
    case 12:
    case 13:
    case 14:
        dst[0] = '-';
        dst[1] = 0;
        break;
    }
}
