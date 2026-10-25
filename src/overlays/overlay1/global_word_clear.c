#include "types.h"

extern s32 D_8008A724[];

void global_word_clear(void)
{
    s16 index = 0;

    do {
        D_8008A724[index] = 0;
        index++;
    } while (index <= 0);
}
