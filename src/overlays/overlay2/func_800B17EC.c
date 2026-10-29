#include "types.h"

typedef struct {
    u8 kind;
    u8 pad01;
    s16 id;
    u8 team;
} Selection;

extern u8 D_80080C90[];

void func_8003A7DC(u16, u8 *);
void func_8003A8CC(u16, u8 *);
void func_8003AE80(u8 *, u8 *);
void func_800B186C(Selection *, u8);

void func_800B17EC(Selection *sel, s16 id) {
    sel->kind = 0;
    sel->id = id;
    func_8003A7DC(id, D_80080C90);
    func_8003A8CC(id, D_80080C90 + 0x6C);
    func_8003AE80(D_80080C90 + 0x6C, D_80080C90 + 0xDA);
    func_800B186C(sel, sel->team);
}
