#include "types.h"

extern u8 D_800892A4;
extern u8 D_800892A5;
extern u8 D_800892A6;
extern u8 D_800892A7;
extern void func_80025794(u8 arg0, u8 arg1, s32 arg2, s16 mode);
extern void func_8002586C(u8 arg0, u8 arg1, s32 arg2, s16 mode);
extern u8 func_800297FC(void *record);

void interface_mode_configure(u8 *record, s16 mode)
{
    func_80025794(record[0x1E], record[0x1F], 5, mode);
    func_8002586C(record[0x1E], record[0x1F], 0x29, mode);
    D_800892A4 = 2;
    D_800892A5 = 0;
    D_800892A6 = func_800297FC(record);
    D_800892A7 = 0xFF;
}
