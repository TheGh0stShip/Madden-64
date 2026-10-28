#include "types.h"

extern s32 D_80064A74[];
extern u16 D_8006B7AA;
extern u16 D_8006B7AC;
extern s16 D_80089320;

u16 func_80031A1C(s32);
void func_80034D30(s32, s32, s32);
void func_80041658(void);
s32 func_80093F0C(void);

void func_80095FA4(void) {
    s16 id;
    s32 sound;

    if (D_80089320 != -1) {
        id = D_8006B7AA & 0x1FFF;
    } else {
        id = D_8006B7AC & 0x1FFF;
    }
    switch (id) {
        case 0x12:
        case 0x13:
        case 0x14:
        case 0x51:
        case 0x52:
        case 0x53:
        case 0x54:
        case 0x55:
        case 0xB8:
            func_80041658();
            sound = 0x20300;
            break;
        case 0x15:
        case 0x16:
        case 0x17:
        case 0x79:
        case 0xB7:
            func_80041658();
            sound = 0x10400;
            break;
        default:
            if (func_80093F0C() == 0) {
                return;
            }
            sound = D_80064A74[func_80031A1C(10)];
            break;
    }
    func_80034D30(sound, 2, 0);
}
