#include "types.h"

typedef struct {
    s32 w[4];
} MenuEntry;

typedef struct {
    MenuEntry entries[3];
} MenuEntryTable;

typedef struct {
    u8 kind;
    u8 pad01[3];
    MenuEntry entries[3];
    u8 pad34[0x70];
    s16 unkA4;
    s16 unkA6;
    s16 unkA8;
    u8 padAA[2];
    void *handler;
    s32 unkB0;
} Menu;

extern MenuEntryTable D_800005E8;
extern Menu *D_80086A2C;
extern void *D_80086DD8;
extern s32 D_80088090;
extern s32 D_80089490;
extern s32 D_80093750;
extern s32 D_80093E64;

void func_8000CB78(s32, s32, s32);
void *func_80032E00(s32, s32);
void func_800418F8(void);
void func_80041BB4(s32);
void func_8009386C(void);
void func_800B7C80(void);
void func_800BCFAC(void);

void func_80097D30(void) {
    MenuEntryTable table;
    u32 i;

    table = D_800005E8;
    func_800418F8();
    func_800B7C80();
    D_80086A2C = func_80032E00(0, 0xC8);
    D_80086A2C->kind = 2;
    D_80086A2C->unkA4 = 3;
    D_80086A2C->unkA8 = 0;
    D_80086A2C->unkA6 = 0;
    D_80086A2C->handler = &D_80093E64;
    for (i = 0; i < 3; i++) {
        D_80086A2C->entries[i] = table.entries[i];
    }
    func_800B7C80();
    func_800BCFAC();
    func_8009386C();
    D_80086A2C->unkB0 = D_80089490;
    func_8000CB78(D_80088090, 0, 0);
    D_80086DD8 = &D_80093750;
    func_80041BB4(7);
}
