#include "types.h"

typedef struct {
    u8 kind;
    u8 pad01;
    s16 id;
} Selection;

typedef struct {
    u8 pad00[0x60];
    Selection *sel;
} Owner;

extern u8 D_80080C90[];

void func_8003A7DC(u16, u8 *);
void func_8003A8CC(u16, u8 *);
void func_8003AE80(u8 *, u8 *);
void func_800B3FE4(Selection *);
void func_800B3E88(Owner *, u16);
void func_8001F25C(s32, s16, s32);

void func_800B478C(Owner *owner, s16 id) {
    Selection *sel = owner->sel;

    sel->id = id;
    func_8003A7DC(id, D_80080C90);
    func_8003A8CC(id, D_80080C90 + 0x6C);
    func_8003AE80(D_80080C90 + 0x6C, D_80080C90 + 0xDA);
    func_800B3FE4(sel);
    func_800B3E88(owner, id);
    func_8001F25C(0, id, 0);
}
