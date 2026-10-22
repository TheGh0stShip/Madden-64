#include "types.h"

extern u8* D_8007A40C[];

u32 func_8003312C(s16 channel) {
    u8* entry = D_8007A40C[channel];
    u32 maximum = 0;

    while (entry != (u8*)-1) {
        u32 size = *(u32*)(entry + 4);
        if (maximum < size) {
            maximum = size;
        }
        entry = *(u8**)(entry + 0x14);
    }
    return maximum;
}
