#include "types.h"

extern u8* D_8007A400[];
extern u16* D_8007A408[];

u8* func_80033558(s16 index) {
    u16* current = D_8007A408[index];
    u8* result = D_8007A400[index] + *current * 28;

    D_8007A408[index] = current - 1;
    return result;
}
