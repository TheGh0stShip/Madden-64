#include "types.h"

typedef struct {
    u32 flags;
    u8 pad04[0xC];
} PlayEntry;

typedef struct {
    u8 pad00[6];
    u16 unk06;
    u16 start;
    u16 end;
    u8 pad0C[0x3C];
    PlayEntry entries[1];
} PlayTable;

extern PlayTable *D_800718E8;
extern u16 D_80087AC4;
extern volatile u16 D_8008A5B4;
extern s16 D_8008AF80;
extern u16 D_8008AFD2;

void func_800B5028(u16);
u16 func_800B5D88(u16);
void func_800B74FC(void);

void func_800BA260(void) {
    if (D_80087AC4 == D_800718E8->end) {
        D_8008AF80 = 1;
        return;
    }
    do {
        if (D_80087AC4 == D_800718E8->end) {
            D_8008AF80 = 1;
            return;
        }
        func_800B5028(D_80087AC4);
        D_80087AC4 = func_800B5D88(D_80087AC4);
        func_800B74FC();
        D_8008AFD2 += (D_800718E8->entries[D_80087AC4].flags >> 7) & 0xF;
    } while ((s16)D_8008AFD2 <= D_8008A5B4 * 2);
    D_8008AFD2 = 0;
}
