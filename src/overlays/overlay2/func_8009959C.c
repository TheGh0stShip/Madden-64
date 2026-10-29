#include "types.h"

/* Slot table at D_800C4AD2: row count, per-row used flags at +0x82, 8 rows of 49 slot ids at
 * +0x8A (0xFFFF = empty), dirty flag at +0x40C (D_800C4EDE). */
typedef struct {
    s8 count;
    u8 pad01[0x81];
    u8 used[8];
    u16 rows[8][49];
    u8 pad39A[0x40C - 0x39A];
    s8 dirty;
} SlotTable;

typedef struct {
    u8 pad00[0x28];
    s32 resource;
    u8 pad2C[0xC];
    s32 extra;
    u8 pad3C[0x14];
    s32 model;
} Scene;

typedef struct {
    u8 pad00[0x3C];
    s32 first;
    s32 second;
    u8 pad44[0x2A];
    u16 music;
} Screen;

typedef struct {
    u8 pad00[0x40];
    s32 a;
    s32 b;
    s32 c;
} Menu;

extern u16 D_80084F40;
extern Scene *D_80087938;
extern s32 D_80088090;
extern s32 D_8008931C;
extern SlotTable D_800C4AD2;

s32 func_8000C8A0(s32);
void func_8000D834(s32, s32);
void func_8000D874(s32, s32);
void func_80016FC4(u16);
void func_80017C24(s32);
void func_80032F3C(s32, Scene *);
void func_80035F88(u16, s32);
void func_80092B98(void);
Menu *func_800DD634(void);

void func_8009959C(Screen *screen) {
    Menu *menu;
    s32 first;
    s32 second;
    s32 row;
    s32 i;

    menu = func_800DD634();
    first = screen->first;
    second = screen->second;
    D_800C4AD2.dirty = 1;
    for (row = 0; row < 8; row++) {
        for (i = 48; i >= 0; i--) {
            D_800C4AD2.rows[row][i] = 0xFFFF;
        }
        D_800C4AD2.used[row] = 0;
    }
    func_8000D874(func_8000C8A0(D_80088090), first);
    func_8000D834(D_8008931C, first);
    func_8000D874(func_8000C8A0(D_80088090), second);
    func_8000D834(D_8008931C, second);
    func_80017C24(D_80087938->model);
    if (D_80087938->extra != 0) {
        func_8000D834(D_8008931C, D_80087938->extra);
    }
    menu->a = 0;
    menu->b = 0;
    menu->c = 0;
    func_80092B98();
    func_80092B98();
    func_80092B98();
    func_80035F88(D_80084F40, D_80087938->resource);
    func_80032F3C(0, D_80087938);
    func_80016FC4(screen->music);
}
