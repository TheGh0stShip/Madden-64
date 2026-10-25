#include "types.h"

extern s16 func_8003CBB8(void);
extern void func_8003CEB8(s32 first, s32 second, s16 position, s32 fourth);

void func_80041E54(s16 index) {
    s16 position = func_8003CBB8() * 10 + index * 3;

    func_8003CEB8(8, 60, position, 16);
}
