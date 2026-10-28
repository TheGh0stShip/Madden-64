#include "types.h"

extern void *D_80087958;
extern s16 D_8008AFC4;
extern s32 D_8008B06C;

void *func_80032E00(s32, s32);
s32 func_80033174(s32, s32, s32);
void func_80033308(s32, void *, s32, s32);

void func_8009AE7C(u16 arg0) {
    void *buffer;

    D_8008AFC4 = arg0;
    D_8008B06C = func_80033174(0, arg0, 8);
    buffer = func_80032E00(0, arg0 * 4);
    D_80087958 = buffer;
    func_80033308(0, buffer, arg0 * 4, 0);
}
