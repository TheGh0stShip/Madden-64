#include "types.h"

extern u8 D_80078445[];
extern u8 D_8007844F[];
extern u8 D_80078490[];

u8* func_8009C7AC(u32 count) {
    u32 value;

    if (count >= 11) {
        count = 10;
    }

    if (count != 0) {
        value = 0x41;
        do {
            D_8007844F[value] = value;
            value++;
        } while (value < count + 0x41);
    }

    if (count < 10) {
        count += 0x4B;
        do {
            D_80078445[count] = count;
            count++;
        } while (count < 0x55);
    }

    D_80078490[10] = 0;
    return D_80078490;
}
