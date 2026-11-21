#include "types.h"

typedef struct {
    s32 data;
    u8 pad04[0x28];
} DisplayImage;

extern DisplayImage D_8007A904[];
extern s32 D_8007A9A8;
extern s32 D_8007A9AC;
void func_8002E17C(s32 arg0, s32 arg1, s32 arg2);
void func_80042170(s32 arg0, u8 digit, s32 arg2, s32 arg3, s32 arg4,
                   s32 arg5, s32 arg6);
extern u32 strlen(const u8 *s);

void display_state_update(s32 buffer, u8 image, u8 value, u8 *text)
{
    u8 tens;
    u8 ones;
    u8 x;

    func_8002E17C(buffer, D_8007A904[image].data, 0x800);
    tens = value / 10;
    ones = value % 10;
    if (value < 100) {
        if (tens != 0 || value == 0) {
            func_80042170(D_8007A9A8, tens, buffer, 0x40, 0x20, 9, 0xB);
            func_80042170(D_8007A9A8, ones, buffer, 0x40, 0x20, 0x18, 0xB);
        } else {
            func_80042170(D_8007A9A8, ones, buffer, 0x40, 0x20, 0x10, 0xB);
        }
    }
    if (text != 0 && *text != 0) {
        x = (12 - (u8)strlen(text)) * 3 / 2;
        while (*text != 0) {
            if (*text == ' ') {
                x += 4;
            } else {
                func_80042170(D_8007A9AC, *text - '.', buffer, 0x40, 0x20, x, 2);
                x += 4;
            }
            text++;
        }
    }
}
