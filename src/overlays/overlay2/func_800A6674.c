#include "types.h"

typedef struct {
    u8 pad00[0x3C];
    s32 unk3C;
    u8 pad40[0x20];
    s32 *home;
    s32 *away;
} Screen;

extern s32 D_80087AA8;
extern s32 D_8008931C;
extern s32 D_80088090;
extern s16 D_80088DB8[];
extern s32 D_800C5CC8[];

void func_8000D874(s32, s32);
void func_8000D834(s32, s32);
s32 func_8000C8A0(s32);
void func_80032F3C(s32, s32 *);
void func_800DD788(s32);

void func_800A6674(Screen *screen) {
    s32 obj = screen->unk3C;
    s32 *home = screen->home;
    s32 *away = screen->away;
    u16 i;

    func_8000D874(D_80087AA8, obj);
    func_8000D834(D_8008931C, obj);
    for (i = 0; i < 8; i++) {
        func_8000D874(func_8000C8A0(D_80088090), home[i]);
        func_8000D834(D_8008931C, home[i]);
        func_8000D874(func_8000C8A0(D_80088090), away[i]);
        func_8000D834(D_8008931C, away[i]);
    }
    func_80032F3C(0, home);
    func_80032F3C(0, away);
    func_800DD788(0x10);
    for (i = 0; i < 4; i++) {
        if (D_80088DB8[i] != -1) {
            func_8000D874(func_8000C8A0(D_80088090), D_800C5CC8[i]);
            func_8000D834(D_8008931C, D_800C5CC8[i]);
        }
    }
}
