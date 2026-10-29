#include "types.h"

typedef struct {
    u8 pad00[0x3C];
    s32 unk3C;
    u8 pad40[0x2A];
    u16 index;
    s32 kind;
} Screen;

extern s8 D_8008B2A8[];

void *func_800DD634(void);
void func_800D6424(s32, s32, s32, s32);
void func_800DF6EC(void);
void func_800DF72C();
void func_800DD4B8(void);
void func_800A7FD0(Screen *, u16, s8);
void func_800A80AC(Screen *, u16, s32);

void func_800A7DBC(Screen *arg0, s32 controller, s16 button) {
    Screen *screen = arg0;
    s8 kind;
    u16 index;

    func_800DD634();
    kind = screen->kind;
    index = screen->index;
    switch (button) {
        case 12:
            func_800D6424(screen->unk3C, 0x14A, 2, 10);
            break;
        case 2:
            func_800DF6EC();
            if (kind > 0) {
                kind--;
            } else {
                kind = 3;
            }
            goto apply;
        case 3:
            func_800DF6EC();
            if (kind < 3) {
                kind++;
            } else {
                kind = 0;
            }
        apply:
            screen->kind = kind;
            func_800A7FD0(screen, index, kind);
            func_800A80AC(screen, index, kind);
            break;
        case 8:
        case 28:
            func_800DF72C();
            D_8008B2A8[index] = kind;
            func_800DD4B8();
            break;
        case 17:
            D_8008B2A8[index] = kind;
            break;
    }
}
