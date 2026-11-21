#include "types.h"

extern s16 D_8008A5B0;
extern s16 D_800876DC;
void func_80030C74(s32 *buttons);
void func_8003E460(void);

s32 func_800E01A8(void) {
    s32 buttons;
    s32 ret;

    func_80030C74(&buttons);
    ret = 0;
    if (D_8008A5B0 == 4) {
        if (buttons & 0xFF3F) {
            ret = 1;
            D_800876DC = 7;
            D_8008A5B0 = 4;
        }
    }
    func_8003E460();
    return ret;
}
