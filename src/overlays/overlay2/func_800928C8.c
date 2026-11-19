#include "m2c.h"

typedef struct { u8 pad[2]; s8 unk2; s8 unk3; u8 unk4; } Hdr;
typedef struct { u8 home, away, hs, as, flags; } Game;
extern s16 D_8007A258;
extern u16 D_80082D94;
extern u16 D_80084EE0;
extern s16 D_800876DC;
extern Hdr *D_8008934C;
extern s8 D_800C509C;
void func_8003A600(s32, s32);
void func_80024EDC(s32);
void func_8003EB2C(void);
void func_80036D38(void);
void func_8002514C(void);
void func_8003EBC8(void);
void func_8008E444(void);
Game *func_8008DC10(s32, s32);
void func_8008E6EC(void);
void func_80093FD8(void);
void func_800928C8(void) {
    s16 i;
    s16 pending;
    Game *g;

    D_8007A258 = 1;
    if (D_800876DC != 7) {
        D_8008934C->unk2 = D_80082D94;
        D_8008934C->unk3 = D_80084EE0;
        D_8008934C->unk4 &= 0xF0;
        D_8008934C->unk4 |= 7;
    } else {
        D_8008934C->unk4 &= 0xF0;
        D_8008934C->unk4 |= 0;
    }
    func_8003A600(1, 1);
    func_80024EDC(1);
    func_8003EB2C();
    for (i = 0; i < 4; i++) {
        func_80036D38();
    }
    if (D_800C509C < 0x11 && D_800876DC != 7) {
        func_8002514C();
    }
    if (D_800C509C < 0x15 && D_800876DC != 7) {
        func_8003EBC8();
    }
    pending = 0;
    func_8008E444();
    for (i = 0; i < 15; i++) {
        g = func_8008DC10(D_800C509C, i);
        if (g->home != 0xFF && !(g->flags & 0xF)) {
            pending++;
        }
    }
    if (pending == 0) {
        func_8008E6EC();
    }
    D_8007A258 = 0;
    func_80093FD8();
}
