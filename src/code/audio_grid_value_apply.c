#include "types.h"

extern s16 func_8003CBB8(void);
extern void func_8003CEB8(s32 channel, s16 first, s32 second, s32 limit);

void func_80041DD4(s32 first, s32 column) {
    s16 row = func_8003CBB8();
    s32 value = (s16)(row * 10 + (s16)column * 3);

    func_8003CEB8(7, (s16)first, value, 16);
}
