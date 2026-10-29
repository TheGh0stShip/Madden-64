#include "types.h"

typedef struct {
    u8 v[15];
} Cells15;

typedef struct {
    u8 pad00[0x14];
    s32 unk14;
    s32 unk18;
    s32 unk1C;
    s32 unk20;
} Board;

extern Cells15 D_8000289C;

void func_8001EC20(s32, s32);
void func_8001ECAC(s32, s32, s32);

void func_800A1658(s32 unused, Board *board, s32 from, s32 to) {
    Cells15 t = D_8000289C;
    u8 *a;
    u8 *b;

    a = t.v + from;
    func_8001ECAC(board->unk1C, *a, 0);
    b = t.v + to;
    func_8001ECAC(board->unk14, *b, 6);
    func_8001EC20(board->unk1C, *a);
    func_8001EC20(board->unk14, *b);
    if (board->unk18 != 0) {
        func_8001ECAC(board->unk20, *a + 1, 0);
        func_8001ECAC(board->unk18, *b + 1, 6);
        func_8001EC20(board->unk20, *a + 1);
        func_8001EC20(board->unk18, *b + 1);
    } else {
        func_8001ECAC(board->unk1C, *a + 1, 0);
        func_8001ECAC(board->unk14, *b + 1, 6);
        func_8001EC20(board->unk1C, *a + 1);
        func_8001EC20(board->unk14, *b + 1);
    }
}
