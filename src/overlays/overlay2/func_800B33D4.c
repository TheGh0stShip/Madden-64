#include "types.h"

typedef struct {
    char name[16];
} Option;

typedef struct {
    u8 pad00[0xF0];
    s32 bufF0;
    s32 bufF4;
} Screen;

extern s8 D_80087960;
extern s16 D_80087962;
extern s8 D_80087965;
extern s8 D_80087966;
extern s8 D_80087967;
extern s8 D_80087968;
extern s8 D_80087969;
extern s8 D_8008796A;
extern s8 D_8008796B;
extern s8 D_8008796C;
extern s8 D_8008796D;
extern s8 D_8008796E;
extern Option D_800BFB64;
extern Option D_800BFB74[9];

s32 func_800E0138(Option *);
void func_800B3558(s32, s32, s32 *, s32);
void func_800B3700(s32, s32, s32 *, s32);
void func_80096714(void);
void func_8009652C(void);
void func_800D5D28(Screen *);
void func_80032F3C(s32, s32);

void func_800B33D4(Screen *screen) {
    s32 value;
    u32 choice;
    s16 length;

    choice = func_800E0138(&D_800BFB64);
    switch (choice) {
        case 0:
            length = 0xB4;
            break;
        case 1:
            length = 0x12C;
            break;
        case 2:
            length = 0x258;
            break;
        case 3:
            length = 0x384;
            break;
        default:
            goto skip;
    }
    D_80087962 = length;
skip:
    D_80087965 = func_800E0138(&D_800BFB74[0]);
    D_80087966 = func_800E0138(&D_800BFB74[1]);
    D_80087967 = func_800E0138(&D_800BFB74[2]);
    D_80087968 = func_800E0138(&D_800BFB74[3]);
    D_80087969 = func_800E0138(&D_800BFB74[4]);
    D_8008796A = func_800E0138(&D_800BFB74[5]);
    D_80087960 = func_800E0138(&D_800BFB74[6]);
    D_8008796B = func_800E0138(&D_800BFB74[7]);
    D_8008796C = func_800E0138(&D_800BFB74[8]);
    func_800B3558(4, 0, &value, 0);
    D_8008796E = value;
    func_800B3700(4, 0, &value, 0);
    D_8008796D = value;
    func_80096714();
    func_8009652C();
    func_800D5D28(screen);
    func_80032F3C(0, screen->bufF0);
    func_80032F3C(0, screen->bufF4);
}
