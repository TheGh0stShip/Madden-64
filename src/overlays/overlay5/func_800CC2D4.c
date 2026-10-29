#include "types.h"

typedef struct PairCC2D4 {
    u16 value;
} PairCC2D4;

extern s32 func_800393E0(u8 value);

void func_800CC2D4(PairCC2D4* source, PairCC2D4* destination, u32 mask) {
    s16 index;

    index = 0;
    do {
        if ((s16)func_800393E0(((u8*)&source[index])[1]) != 0) {
            destination[index].value = source[index].value | mask;
        } else {
            destination[index].value = source[index].value;
        }
        index++;
    } while (index < 3);
}
