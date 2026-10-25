#include "types.h"

extern s32 D_8008B35C;
extern s32 D_80085E68[];

void runtime_record_copy(s32 *destination)
{
    volatile s32 *source = D_80085E68 + D_8008B35C * 12;

    destination[0] = source[0];
    destination[1] = source[1];
    destination[2] = source[2];
    destination[3] = source[3];
    destination[4] = source[4];
    destination[5] = source[5];
    destination[6] = source[6];
    destination[7] = source[7];
    destination[8] = source[8];
    destination[9] = source[9];
    destination[10] = source[10];
    destination[11] = source[11];
}
