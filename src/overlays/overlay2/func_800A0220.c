#include "types.h"

typedef struct {
    s32 v[6];
} Columns;

typedef struct {
    u8 pad00[8];
    s32 unk08;
    u8 pad0C[0x180];
    s32 state;
    s32 unk190;
    s32 unk194;
    s32 unk198;
    s32 unk19C;
    s32 unk1A0;
    s32 unk1A4;
} Panel;

extern Columns D_800027D0;
extern Columns D_800027E8;

void func_8001EC20(s32, s32);

void func_800A0220(Panel *panel, s32 *cells) {
    Columns cols[2];
    s32 a;
    s32 b;

    cols[0] = D_800027D0;
    cols[1] = D_800027E8;
    a = cols[0].v[panel->state];
    b = cols[1].v[panel->state];
    cells[a] = panel->unk198;
    cells[b] = panel->unk19C;
    cells[a + 1] = panel->unk1A0;
    cells[b + 1] = panel->unk1A4;
    panel->unk194 = 1;
    func_8001EC20(panel->unk08, a);
    func_8001EC20(panel->unk08, b);
    func_8001EC20(panel->unk08, a + 1);
    func_8001EC20(panel->unk08, b + 1);
    panel->unk190 = 0;
}
