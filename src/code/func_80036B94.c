#include "types.h"

typedef struct {
    s32 unk0;
    s32 unk4;
    u8 pad8[4];
} Sub36B94;

typedef struct {
    Sub36B94 *entries;
    s32 count;
    u8 *flags;
    s32 handle;
    u8 pad10[8];
} Slot36B94;

typedef struct {
    u8 pad0[8];
    s32 index;
    u16 id;
} Cur36B94;

void func_800365B8(s32, u8 *, s32);
void func_80036628(s32, s32, s32);
void func_8003663C(u16, s32, s32);
void func_80040348(void);
extern Cur36B94 *D_80071308;
extern s32 D_8007A500;
extern Slot36B94 D_8008B078[];

void func_80036B94(void) {
    Cur36B94 *cur;
    s32 index;
    u16 id;
    s32 n;
    s32 saved;

    cur = D_80071308;
    if (cur != 0) {
        id = cur->id;
        index = cur->index;
        if (id & 0x4000) {
            id &= 0xBFFF;
            n = D_8008B078[id].count;
            func_80036628(D_8008B078[id].handle, index * n, 0);
            func_800365B8(D_8008B078[id].handle, D_8008B078[id].flags, n);
        } else {
            saved = D_8007A500;
            D_8007A500 = 0;
            func_8003663C(id, index, D_8008B078[id].entries[index].unk4);
            D_8007A500 = saved;
            D_8008B078[id].flags[index] &= 0xFE;
        }
        func_80040348();
    }
}
