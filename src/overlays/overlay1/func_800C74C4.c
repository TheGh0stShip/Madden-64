#include "types.h"

typedef struct {
    u8 pad00[0x1C];
    s16 x;
    u8 pad1E[2];
    s16 y;
} Camera;

extern u32 D_80080C10;
extern Camera *D_80086178;
typedef struct {
    u8 timer;
    u8 pad01;
    s16 x;
    s16 y;
    u8 pad06[6];
    s32 time;
} Flash;

extern Flash D_80087AB0;
extern s16 D_80088AE4;
extern u16 D_8008935C;
extern s32 D_8008A058;

void func_8004192C(s32);
void func_80041DD4(s32, s32, s32);
void func_800C5F80(void);

void func_800C74C4(void) {
    u8 *timer;
    s32 x;
    s32 y;

    if (D_80080C10 & 0x4000) {
        D_80087AB0.timer = 0;
        switch ((s16)(D_8008935C - 2)) {
            case 3:
                D_80087AB0.timer = 10;
                break;
            case 2:
                D_80087AB0.timer = 14;
                break;
            case 1:
                D_80087AB0.timer = 6;
                break;
            case 4:
                D_80087AB0.timer = 20;
                break;
            case 0:
                D_80087AB0.timer = 8;
                break;
            case 7:
                D_80087AB0.timer = 4;
                break;
        }
        timer = &D_80087AB0.timer;
        if (*timer != 0) {
            D_80087AB0.time = D_8008A058;
            x = D_80086178->x;
            D_80087AB0.x = x;
            y = D_80086178->y;
            D_80087AB0.y = y;
            func_800C5F80();
            if (*timer == 6) {
                if (D_80088AE4 == 0) {
                    func_80041DD4(0x3A, 0xF, 0xF0);
                } else {
                    func_8004192C(1);
                }
            }
        }
    }
}
