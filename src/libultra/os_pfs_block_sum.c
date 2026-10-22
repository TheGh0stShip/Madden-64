#include "pfs.h"

s32 __osBlockSum(OSPfs* pfs, u8 page, u16* sum, u8 bank) {
    int index;
    s32 result = 0;
    u8 data[32];

    pfs->activebank = bank;
    result = __osPfsSelectBank(pfs);
    if (result != 0) {
        return result;
    }
    for (index = 0; index < 8; index++) {
        result = __osContRamRead(pfs->queue, pfs->channel,
                                 page * 8 + index, data);
        if (result != 0) {
            pfs->activebank = 0;
            __osPfsSelectBank(pfs);
            return result;
        }
        *sum = *sum + __osSumcalc(data, 32);
    }
    pfs->activebank = 0;
    result = __osPfsSelectBank(pfs);
    return result;
}
