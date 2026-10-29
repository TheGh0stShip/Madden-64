#include "types.h"

typedef struct {
    u8 pad00[0x64];
    s32 unk64;
    u8 pad68[4];
    s32 unk6C;
    u8 pad70[0x30];
    s32 unkA0;
} Screen;

extern s32 D_80088090;
extern s32 D_8008931C;
extern s8 D_800C5D44;

s32 func_8000C8A0(s32);
void func_8000CDC0(void);
void func_8000D834(s32, s32);
void func_8000D874(s32, s32);
void func_800940D4(void);
void func_800D5D28(Screen *);

void func_800A2834(Screen *arg0) {
    Screen *screen = arg0;

    if (arg0->unk64 == 0) {
        func_8000D874(func_8000C8A0(D_80088090), arg0->unkA0);
        func_8000D834(D_8008931C, arg0->unkA0);
    }
    func_800D5D28(screen);
    if (screen->unk6C == 0 && D_800C5D44 != 2) {
        func_800940D4();
    }
    func_8000CDC0();
}
