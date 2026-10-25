#include "types.h"

extern s32 D_80088620;
extern s32 D_80086180;
extern s16 D_80086DA8;
extern s8 D_80086DE4[];
typedef struct DisplayValueRecord {
    u16 value;
    u8 pad02[4];
} DisplayValueRecord;

extern DisplayValueRecord D_8008B3B0[];
extern u32 D_80087100[];

void display_values_refresh(void)
{
    volatile u64 unused;

    if (D_80088620 != D_80086180) {
        s32 count;
        s32 index = 0;
        if (D_80086DA8 > 0) {
            u32 *output;
            count = D_80086DA8;
            output = D_80087100;
            do {
                s32 row = D_80086DE4[index];
                *output = D_8008B3B0[row].value & 0xFF3F;
                index++;
                output++;
            } while (index < count);
        }
        D_80086180 = D_80088620;
    }
}
