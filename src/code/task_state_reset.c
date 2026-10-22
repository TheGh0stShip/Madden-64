#include "types.h"

extern u8 D_80085E68;
extern s32 D_8008B35C;
extern void func_8002CB18(void* state);

void func_8002CAA0(void) {
    D_8008B35C = 0;
    func_8002CB18(&D_80085E68);
}
