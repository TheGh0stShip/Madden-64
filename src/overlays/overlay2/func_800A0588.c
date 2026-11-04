#include "types.h"

typedef struct ColumnValuesA0588 {
    s32 values[6];
} ColumnValuesA0588;

typedef struct PanelA0588 {
    s32 primary;
    s32 secondary;
    s32 grid;
    u8 pad0C[0x180];
    u32 mode;
} PanelA0588;

extern ColumnValuesA0588 D_800027E8;

void func_8001EC20(s32, s32);
void func_8001ECAC(s32, s32, s32);

void func_800A0588(s32 unused, PanelA0588* panel, s32 from, s32 to) {
    ColumnValuesA0588 columns = D_800027E8;
    s32* base;
    s32* first;
    s32* last;

    base = columns.values;
    if (panel->mode < 6) {
        first = base - -from;
        func_8001ECAC(panel->grid, *first, 0);
        func_8001ECAC(panel->grid, *first + 1, 0);
        last = base - -to;
        func_8001ECAC(panel->grid, *last, 6);
        func_8001ECAC(panel->grid, *last + 1, 6);
        func_8001EC20(panel->grid, *first);
        func_8001EC20(panel->grid, *first + 1);
        func_8001EC20(panel->grid, *last);
        func_8001EC20(panel->grid, *last + 1);
    } else {
        func_8001ECAC(panel->primary, 7, 6);
        func_8001ECAC(panel->secondary, 0xE, 6);
        func_8001EC20(panel->primary, 7);
        func_8001EC20(panel->secondary, 0xE);
    }
}
