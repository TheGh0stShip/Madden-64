#include "types.h"

typedef struct {
    u8 pad0[0x1A];
    u16 unk_1A;
} State;

typedef struct {
    u8 pad0[0xA8];
    u16 unk_A8;
    u8 padAA[0xB8 - 0xAA];
    s16 unk_B8;
} Player;

typedef struct {
    u8 pad0[0x8];
    Player *unk_08;
} Obj;

extern State *D_80088090;
u8 func_800BF624(u16 arg0);
void func_8000EBEC(Obj *obj, u8 arg1);

void func_800C3D68(Obj *obj) {
    Player *player = obj->unk_08;
    u16 raw = D_80088090->unk_1A;
    s32 angle;
    s16 limit = 0x11B3;

    if (player->unk_B8 < 0) {
        angle = (s16)raw;
        if (angle < -limit) {
            angle = -limit - angle;
            player->unk_A8 |= 8;
            func_8000EBEC(obj, func_800BF624(angle));
        } else {
            player->unk_A8 &= ~8;
        }
    } else {
        angle = (s16)raw;
        if (angle > limit) {
            angle -= limit;
            player->unk_A8 |= 8;
            func_8000EBEC(obj, func_800BF624(angle));
        } else {
            player->unk_A8 &= ~8;
        }
    }
}
