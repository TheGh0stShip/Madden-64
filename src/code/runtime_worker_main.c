#include "types.h"

extern u8 D_80089278[];
extern void* D_8008B37C;
extern u8 D_800884B0[];

extern void func_8004CDA8(void* queue, void* message, s32 flags);
extern void func_80031A78(void);
extern void func_8002E17C(void* destination, const void* source, u32 size);
extern void func_800313AC(void);
extern void func_80004C98(void);

void func_80032498(void) {
    func_8004CDA8(D_80089278, 0, 1);
    func_80031A78();
    func_8002E17C(D_8008B37C, D_800884B0, 0x50);
    func_800313AC();
    func_80004C98();
    while (1) {
    }
}
