#include "types.h"

typedef struct {
    u32 flags;
    u8 pad04[0xC];
} PlayEntry;

typedef struct {
    u8 pad00[8];
    u16 last;
    u8 pad0A[0x3E];
    PlayEntry entries[1];
} PlayTable;

extern PlayTable *D_800718E8;
extern u16 D_80087AC4;
extern volatile u16 D_8008A5B4;
extern s16 D_8008AF80;
extern u16 D_8008AFD2;

void func_800B5028(u16);
u16 func_800B5D88(u16);
u16 func_800B5DA8(u16);
void func_800B74FC(void);

void func_800BA348(void) {
    u16 cur;
    s32 m;
    u32 i;
    u16 n;

    if (D_80087AC4 == D_800718E8->last) {
        D_8008AF80 = 1;
        return;
    }
    do {
        D_80087AC4 = func_800B5DA8(D_80087AC4);
        func_800B74FC();
        cur = D_80087AC4;
        i = cur;
        if (i == D_800718E8->last) {
            D_8008AF80 = 1;
            D_8008AFD2 = 100;
        }
        D_8008AFD2 += (D_800718E8->entries[i].flags >> 7) & 0xF;
    } while ((s16)D_8008AFD2 <= D_8008A5B4 * 2);
    D_8008AFD2 = 0;
    m = i & 7;
    n = m;
    if (m == 0) {
        func_800B5028(i);
        return;
    }
    D_80087AC4 = cur - m;
    while (n != 0) {
        n--;
        func_800B5028(D_80087AC4);
        D_80087AC4 = func_800B5D88(D_80087AC4);
        func_800B74FC();
    }
}
