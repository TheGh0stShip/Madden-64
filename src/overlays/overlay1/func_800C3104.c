#include "types.h"

typedef struct {
    u8 pad00[0x20];
    s32 unk_20;
} SlotObject;

typedef struct {
    SlotObject *obj;
    s32 unk04;
} ObjectSlot;

typedef struct {
    u8 pad00[0x1E];
    u8 team;
    u8 pad1F[0x94 - 0x1F];
    s32 unk_94;
    s32 unk_98;
} Player;

extern s32 D_80080C10;
extern u16 D_8008A71C;
extern s16 D_80080C20;
extern u16 D_8008A3FC;
extern u16 D_8008A5B4;
extern u16 D_80064A4E;
extern char D_80087124[];
extern ObjectSlot D_80086DEC[];
extern s16 D_8008A6A0;
extern s16 D_8008A6C0;
extern Player *D_80080C2C;
extern s16 D_800886E0;
extern s16 D_80086C38;
extern s16 D_80086BEA;
extern s8 *D_80088DC0;
extern u8 *D_80087A98;
extern s8 *D_80080C80;
extern u8 *D_80084F74;
extern s16 D_80080C0A;
extern s16 D_8008501C;
extern u8 *D_8008AF94;

s32 func_800B9050(void);
u8 func_800A6580(void);
void func_800167FC(s16, char *);
void func_8001EC20(SlotObject *, s32);

void func_800C3104(void) {
    s32 speed;
    s32 delta;
    s32 value;

    if (!(D_80080C10 & 0x2000)) {
        return;
    }
    if (D_8008A71C & 1) {
        return;
    }
    if (D_80080C20 == 3 && func_800B9050() != 0) {
        D_8008A3FC -= D_8008A5B4;
        if ((s16)D_8008A3FC < 0) {
            D_8008A3FC += 15;
            func_800167FC(D_80064A4E / 19, D_80087124);
            func_8001EC20(D_80086DEC[D_8008A6A0].obj, 1);
        }
    }
    if (D_80080C2C == 0) {
        return;
    }
    speed = D_80080C2C->unk_94;
    D_80080C10 |= 0x10000;
    if (func_800A6580() == 7 && D_80080C2C->team == D_800886E0) {
        speed = -speed;
    }
    delta = (speed << 8) / 240;
    delta = (delta * D_80086C38) >> 8;
    if (delta == 0) {
        D_80088DC0[0] = -1;
        D_80088DC0[1] = 0x7F;
        value = 0x7FFF;
        *(s32 *)(D_8008AF94 + 0x1C) = D_80080C0A - 4;
    } else {
        D_80088DC0[0] = D_80080C0A;
        D_80088DC0[1] = (u16)D_80080C0A >> 8;
        value = D_80080C0A;
        value += delta;
        *(s32 *)(D_8008AF94 + 0x1C) = value - 4;
    }
    D_80087A98[0] = value;
    D_80087A98[1] = value >> 8;
    delta = (((D_80080C2C->unk_98 & 0x7FFF) << 8) / 48 * D_80086BEA) >> 8;
    if (delta == 0) {
        D_80080C80[0] = -1;
        D_80080C80[1] = 0x7F;
        value = 0x7FFF;
    } else {
        D_80080C80[0] = D_8008501C;
        D_80080C80[1] = (u16)D_8008501C >> 8;
        value = D_8008501C;
        value -= delta;
    }
    D_80086DEC[D_8008A6C0].obj->unk_20 = value;
    D_80084F74[0] = value;
    D_80084F74[1] = value >> 8;
}
