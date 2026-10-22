#include "types.h"

extern void func_80008F30(void* context, void* callback, void* argument, s32 mode);
extern u8 D_80013D84;

void func_80013B5C(void* argument, void* context) {
    func_80008F30(context, &D_80013D84, argument, 2);
}
