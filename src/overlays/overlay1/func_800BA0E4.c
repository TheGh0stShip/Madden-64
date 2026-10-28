#include "types.h"

typedef struct {
    u8 unk00[8];
    u32 flags;
    u8 unk0C[4];
} SeqEntry;

typedef struct {
    u8 unk00[0xA];
    u16 last;
    u8 unk0C[0x34];
    SeqEntry entries[1];
} SeqTable;

extern SeqTable *D_800718E8;
extern u16 D_80087AC4;
extern u16 D_8008A5B4;
extern s16 D_8008AF80;
extern u16 D_8008AFD2;

void func_800B5028(u16, s32, SeqTable *);
u16 func_800B5D88(u16);
void func_800B74FC(void);

void func_800BA0E4(void) {
    s32 step;

    D_8008AFD2 += D_8008A5B4;
    for (;;) {
        step = (D_800718E8->entries[D_80087AC4].flags >> 7) & 0xF;
        if ((s16)D_8008AFD2 < step) {
            return;
        }
        D_8008AFD2 = (s16)D_8008AFD2 - step;
        if (D_80087AC4 == D_800718E8->last) {
            break;
        }
        func_800B5028(D_80087AC4, step, D_800718E8);
        D_80087AC4 = func_800B5D88(D_80087AC4);
        func_800B74FC();
    }
    D_8008AF80 = 1;
    D_8008AFD2 = 0;
}
